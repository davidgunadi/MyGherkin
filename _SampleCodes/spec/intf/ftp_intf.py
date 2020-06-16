from abc import abstractmethod
from E2EContext import E2EContext
from driver.FtpDriver import FtpDriver
from util.runner import Session


class IFtp(Session):

    def __init__(self, e2e: E2EContext):
        super().__init__(e2e)

    @abstractmethod
    def ftp_connection_to_envhost_as_driver(
        self,
        driver: FtpDriver,
        envhost: str,
    ):
        """
        FTP connection to "<envhost>" [as "<ftp driver instance id>"]
        SFTP connection to "<envhost>" [as "<ftp driver instance id>"]

        * <envhost> (required): host definition from environment to connect to
        * <ftp driver instance id> (optional): a shortcut to this connection, "ftp" by default
        """
        pass

    @abstractmethod
    def i_download_filemask_from_driver(
        self,
        driver: FtpDriver,
        filemask: str,
    ):
        """
        I download "<filemask>" [from "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to download
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
        pass

    @abstractmethod
    def i_remove_filemask_at_driver(
        self,
        driver: FtpDriver,
        filemask: str,
    ):
        """
        I remove "<filemask>" [at "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to remove
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
        pass

    @abstractmethod
    def i_list_files_in_folder_folder_at_driver(
        self,
        driver: FtpDriver,
        folder: str,
    ):
        """
        I list files in "<folder>" folder [at "<ftp driver instance id>"]

        * <folder> (required): folder where to list files
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
        pass

    @abstractmethod
    def i_wait_while_filemask_appears_at_driver(
        self,
        driver: FtpDriver,
        filemask: str,
    ):
        """
        I wait while "<filemask>" appears [at "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to monitor
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
        pass

    @abstractmethod
    def i_wait_unless_filemask_appears_at_driver(
        self,
        driver: FtpDriver,
        filemask: str,
    ):
        """
        I wait unless "<filemask>" appears [at "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to monitor
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
        pass

    @abstractmethod
    def operations_on_driver_should_complete_successfully(
        self,
        driver: FtpDriver,
    ):
        """
        operations [on "<ftp driver instance id>"] should complete successfully

        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
        pass

    @abstractmethod
    def operations_on_driver_should_fail(
        self,
        driver: FtpDriver,
    ):
        """
        operations [on "<ftp driver instance id>"] should fail

        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
        pass

    @abstractmethod
    def filename_should_be_in_the_files_list_at_driver(
        self,
        driver: FtpDriver,
        filename: str,
    ):
        """
        "<filename>" should be in the files list [at "<ftp driver instance id>"]

        * <filename> (required): exact file name in file list output or in download output
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
        pass

    @abstractmethod
    def i_put_the_list_of_files_in_folder_at_driver_into_variable(
        self,
        driver: FtpDriver,
        folder: str,
        variable: str,
    ):
        """
        I put the list of files in "<folder>" [at "<ftp driver instance id>"] into "<variable>"

        * <folder> (required): folder where to list files
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        * <variable> (required): variable name to store extracted value
        """
        pass
