from driver.FtpDriver import FtpDriver
from spec.ftp import spec
from spec.intf.ftp_intf import IFtp


class FtpImpl(IFtp):

    @spec.not_implemented(jira='E2EPLTFRM-23')
    def protocol_connection_to_endpoint_as_driver(
            self,
            driver: FtpDriver,
            protocol: str,
            endpoint: str,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-100')
    def i_upload_file_to_folder_at_driver(
            self,
            driver: FtpDriver,
            file: str,
            folder: str
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-24')
    def i_download_filemask_from_driver(
            self,
            driver: FtpDriver,
            filemask: str,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-25')
    def i_remove_filemask_at_driver(
            self,
            driver: FtpDriver,
            filemask: str,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-26')
    def i_list_files_in_folder_at_driver(
            self,
            driver: FtpDriver,
            folder: str,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-27')
    def i_wait_while_filemask_appears_at_driver(
            self,
            driver: FtpDriver,
            filemask: str,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-28')
    def i_wait_unless_filemask_appears_at_driver(
            self,
            driver: FtpDriver,
            filemask: str,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-29')
    def operations_on_driver_should_complete_successfully(
            self,
            driver: FtpDriver,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-30')
    def operations_on_driver_should_fail(
            self,
            driver: FtpDriver,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-31')
    def filename_should_be_in_the_files_list_at_driver(
            self,
            driver: FtpDriver,
            filename: str,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-32')
    def i_put_the_list_of_files_in_folder_at_driver_into_variable(
            self,
            driver: FtpDriver,
            folder: str,
            variable: str,
    ):
        self.i_remember_the_list_of_files_in_folder_at_driver_as_variable(driver, folder, variable)

    @spec.not_implemented(jira='E2EPLTFRM-32')
    def i_remember_the_list_of_files_in_folder_at_driver_as_variable(
            self,
            driver: FtpDriver,
            folder: str,
            variable: str,
    ):
        raise NotImplementedError()
