_One of the first things you may want to do after setting up a new Ubuntu box is to enable public key authentication over SSH._ It adds both, improved security and greater ease of use. Security is improved, because only computers possessing the correct public and private key combination can access a box. Furthermore, SSH key authentication has become very robust and secure over the years. Ease of use is improved, because you will no longer have to enter a password when accessing the box via SSH. Obviously, this means that this strategy should not be used when sharing your account with multiple people.

You need an SSH key-pair, which you can generate using the keygen tool.

    ssh-keygen

This creates two new files in your `~/.ssh/` directory. The `.pub` file is your public key. Now, depending on whether you have encrypted your home folder on the remote box or not, this public key needs to be added to a file holding all the authorized keys.

**Non-encrypted home folder**

Upload your public key file to `~/.ssh` directory on the remote box, and then add the key itself to the `authorized_keys` file.

    scp ~/.ssh/id_rsa.pub [user]@[box]:/home/[user]/.ssh/[key_name].pub
    ssh [user]@[box]
    echo `cat ~/.ssh/[key_name].pub` >> ~/.ssh/authorized_keys
  
Make sure that the `authorized_keys` file has rw-permissions for the owner, and r-permissions for the group and others (`sudo chmod 644 ~/.ssh/authorized_keys`). _You should now be able to login without being prompted for a password._

**Encrypted home folder**

In case your user's home folder is encrypted, SSH cannot access the `authorized_keys` file, so this file needs to be moved outside of the home folder. As an admin, you might want to do this no matter what, even if the user's home folder is not encrypted.

To have SSH find the location of the `authorized_keys` file, uncomment and edit this line in your `/etc/ssh/sshd_config` on the remote box.

    AuthorizedKeysFile /etc/ssh/[user]/authorized_keys

Now, instead of creating the `authorized_keys` file in your user's `~/.ssh` directory, place it in `/etc/ssh/[user]`. Make sure it has 644-permissions (`-rw-r--r--`) and the directory has 755-permissions (`drwxr-xr-x`). Restart the SSH service and you are ready to go.

    sudo service ssh restart

**SSH config adjustments**

Not having to enter a password each time you want to access the remote box is already pretty nice, but you can still make it a bit easier, especially if you have a very customized SSH setup, i.e. custom port number. To do this, create or append your `~/.ssh/config` file on your local computer, and add something along the lines of this:

    Host omega
      User larry
      Port 5399
      HostName 192.168.178.1

Now, as the fictionaly user `larry` wanting to connect to a box at `192.168.178.1` via port 5399, you can just type the following and you're in:

    ssh omega
  
**Authentication logs**

For good measure, this is the default location of the authentication log.

    /var/log/auth.log

That is all.