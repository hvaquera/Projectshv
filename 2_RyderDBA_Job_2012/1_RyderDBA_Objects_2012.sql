USE [master]
GO
IF NOT EXISTS (SELECT 1 FROM master..sysdatabases where name='DBA')
	CREATE DATABASE DBA
GO
ALTER DATABASE DBA SET RECOVERY SIMPLE
GO

USE DBA
GO

declare @version varchar(47)
select @version = @@version

if (charindex(N'2008',@version,1)>0) OR (CHARINDEX(N'2012',@version, 1) > 0) 
begin
	exec(N'master..sp_configure ''show advanced options'',1')
	exec(N'reconfigure with override')
	exec(N'master..sp_configure ''xp_cmdshell'',1')
	exec(N'reconfigure with override')
	exec(N'master..sp_configure ''Ole Automation Procedures'',1')
	exec(N'reconfigure with override')
	exec(N'master..sp_configure ''show advanced options'',0')
	exec(N'reconfigure with override')
	exec(N'USE DBA')
	
	--**************************************************
	-- Drop Process Starts for SQL Server 2008
	--***************************************************

	/****** Object:  Table [dbo].[tbl_dba_maintenance_history]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_maintenance_history]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_maintenance_history]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_CheckVersion]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_CheckVersion]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_CheckVersion]
	
	/****** Object:  Table [dbo].[tbl_dba_sqlagent_monitor]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_sqlagent_monitor]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_sqlagent_monitor]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_generate_login_defDB]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_generate_login_defDB]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_generate_login_defDB]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_delete_backup]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_delete_backup]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_delete_backup]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_full_backup_archive]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_full_backup_archive]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_full_backup_archive]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_block_main]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_block_main]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_block_main]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_checkdb]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_checkdb]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_checkdb]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_updatestats]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_updatestats]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_updatestats]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_updateusage]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_updateusage]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_updateusage]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_reindex]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_reindex]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_reindex]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_CheckLogSpace]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_CheckLogSpace]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_CheckLogSpace]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_Drive_Space]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_Drive_Space]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_Drive_Space]
	
	/****** Object:  UserDefinedFunction [dbo].[ufn_dba_QueryFile]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_dba_QueryFile]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [dbo].[ufn_dba_QueryFile]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_Initiate_FGBackup]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_Initiate_FGBackup]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_Initiate_FGBackup]
	
	/****** Object:  Table [dbo].[tbl_dba_FileGroup]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_FileGroup]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_FileGroup]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_TSMBackupDetail]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_TSMBackupDetail]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_TSMBackupDetail]
	
	/****** Object:  Table [dbo].[tbl_dba_Monitor_SQLService]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_Monitor_SQLService]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_Monitor_SQLService]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_Monitor_SQLService]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_Monitor_SQLService]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_Monitor_SQLService]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_StopTrace]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_StopTrace]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_StopTrace]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_StartTrace]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_StartTrace]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_StartTrace]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_AlterIndex]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_AlterIndex]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_AlterIndex]
	
	/****** Object:  Table [dbo].[tbl_dba_CHECKDB_Output]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_CHECKDB_Output]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_CHECKDB_Output]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_Start_FullBackup]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_Start_FullBackup]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_Start_FullBackup]
	
	/****** Object:  Table [dbo].[tbl_dba_REINDEX_Output]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_REINDEX_Output]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_REINDEX_Output]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_Start_DiffBackup]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_Start_DiffBackup]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_Start_DiffBackup]
	
	/****** Object:  Table [dbo].[tbl_dba_AlterIndex_Output]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_AlterIndex_Output]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_AlterIndex_Output]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_kill_process]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_kill_process]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_kill_process]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_resync_users]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_resync_users]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_resync_users]
	
	/****** Object:  Table [dbo].[tbl_dba_window_Logins]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_window_Logins]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_window_Logins]
	
	/****** Object:  Table [dbo].[tbl_dba_Logins_defaultDB]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_Logins_defaultDB]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_Logins_defaultDB]
	
	/****** Object:  Table [dbo].[tbl_dba_SQL_Logins_05]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_SQL_Logins_05]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_SQL_Logins_05]
	
	/****** Object:  Table [dbo].[tbl_dba_SQL_Logins]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_SQL_Logins]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_SQL_Logins]
	
	/****** Object:  Table [dbo].[tbl_dba_full_backup_archive]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_full_backup_archive]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_full_backup_archive]
	
	/****** Object:  Table [dbo].[tbl_dba_Block_Interval_Config]    Script Date: 09/20/2007 18:04:28 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_Block_Interval_Config]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_Block_Interval_Config]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_block_record]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_block_record]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_block_record]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_block_alert]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_block_alert]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_block_alert]
	
	/****** Object:  Table [dbo].[tbl_dba_Drive_Space]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_Drive_Space]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_Drive_Space]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_SendMail]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_SendMail]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_SendMail]
	
	/****** Object:  Table [dbo].[tbl_dba_DriveSpace_Config]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_DriveSpace_Config]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_DriveSpace_Config]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_log_backup]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_log_backup]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_log_backup]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_FileGroup_backup]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_FileGroup_backup]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_FileGroup_backup]
	
	/****** Object:  Table [dbo].[tbl_dba_TSMReport_Config]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_TSMReport_Config]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_TSMReport_Config]
	
	/****** Object:  Table [dbo].[tbl_dba_TSMLog]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_TSMLog]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_TSMLog]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_full_backup]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_full_backup]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_full_backup]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_diff_backup]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_diff_backup]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_diff_backup]
	
	/****** Object:  Table [dbo].[tbl_dba_maint_file_location]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_maint_file_location]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_maint_file_location]
	
	/****** Object:  Table [dbo].[tbl_dba_Ticket_Content]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_Ticket_Content]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_Ticket_Content]
	
	/****** Object:  Table [dbo].[tbl_dba_Alert_Config]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_Alert_Config]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_Alert_Config]
	
	/****** Object:  Table [dbo].[tbl_dba_SMTPServer_Config]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_SMTPServer_Config]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_SMTPServer_Config]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_send_cdosysmail]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_send_cdosysmail]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_send_cdosysmail]
	
	/****** Object:  Table [dbo].[tbl_dba_block_tracker_batch]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_block_tracker_batch]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_block_tracker_batch]
	
	/****** Object:  Table [dbo].[tbl_dba_block_tracker]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_block_tracker]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_block_tracker]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_starting_batch_alert_get]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_starting_batch_alert_get]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_starting_batch_alert_get]
	
	/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_maintenance_u]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_maintenance_u]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_maintenance_u]
	
	/****** Object:  Table [dbo].[tbl_dba_BackupPlan_History]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_BackupPlan_History]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_BackupPlan_History]
	
	/****** Object:  Table [dbo].[tbl_dba_BackupPlan]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_BackupPlan]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_BackupPlan]
	
	/****** Object:  StoredProcedure [dbo].[usp_dba_GSMID_Setting]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_GSMID_Setting]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_GSMID_Setting]
	
	/****** Object:  Table [dbo].[tbl_dba_full_backup_completed]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_full_backup_completed]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_full_backup_completed]
	
	/****** Object:  Table [dbo].[tbl_dba_maintenance_config]    Script Date: 09/20/2007 18:04:29 ******/
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_maintenance_config]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_maintenance_config]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_CallLogShippingBackupJob]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_CallLogShippingBackupJob]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_dba_getMajorVersion]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [dbo].[ufn_dba_getMajorVersion]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_dba_IsLogShippingDatabase]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [dbo].[ufn_dba_IsLogShippingDatabase]

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_Version]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_Version]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_IncDBAVersion]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_IncDBAVersion]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_tbl_dba_DBAVersion]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_tbl_dba_DBAVersion]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_SetDBAVersion]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_SetDBAVersion]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uf_tbl_dba_getDBAVersion]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [dbo].[uf_tbl_dba_getDBAVersion]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uf_tbl_dba_packageExist]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [dbo].[uf_tbl_dba_packageExist]

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uf_dba_CompressionSupported]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [dbo].[uf_dba_CompressionSupported];

	IF  EXISTS (SELECT * FROM master.sys.server_triggers WHERE parent_class_desc = 'SERVER' AND name = N't_ryderdba_0')
	DROP TRIGGER [t_ryderdba_0] ON ALL SERVER

	IF  EXISTS (SELECT * FROM master.sys.server_triggers WHERE parent_class_desc = 'SERVER' AND name = N't_ryderdba_1')
	DROP TRIGGER [t_ryderdba_1] ON ALL SERVER

	IF  EXISTS (SELECT * FROM master.sys.server_triggers WHERE parent_class_desc = 'SERVER' AND name = N't_ryderdba_4')
	DROP TRIGGER [t_ryderdba_4] ON ALL SERVER

	IF  EXISTS (SELECT * FROM master.sys.server_triggers WHERE parent_class_desc = 'SERVER' AND name = N't_ryderdba_5')
	DROP TRIGGER [t_ryderdba_5] ON ALL SERVER

	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_dba_longrunningjobs]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[tbl_dba_longrunningjobs]
	
	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_dba_jobs_config]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[tbl_dba_jobs_config]
	
	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[fn_hex_to_char]') AND xtype in (N'FN', N'IF', N'TF'))
	DROP FUNCTION [dbo].[fn_hex_to_char]

	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_long_running_jobs]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[usp_long_running_jobs]

	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_tbl_dba_populate_jobs_config_table]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[usp_tbl_dba_populate_jobs_config_table]

	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_tbl_dba_MSDB_Clean_Up]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[usp_tbl_dba_MSDB_Clean_Up]

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_query_perf_analysis_cpu]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_query_perf_analysis_cpu]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_query_perf_analysis_cpu]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_query_perf_analysis_cpu]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_query_perf_analysis_frs]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_query_perf_analysis_frs]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_query_perf_analysis_frs]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_query_perf_analysis_frs]

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_query_perf_analysis_io]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_query_perf_analysis_io]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_query_perf_analysis_io]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_query_perf_analysis_io]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_dba_query_perf_analysis_mii]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_dba_query_perf_analysis_mii]
	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dba_query_perf_analysis_mii]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_dba_query_perf_analysis_mii]
	
	IF OBJECT_ID(N'tbl_dba_archive_Drive_Space', N'U') IS NOT NULL
	DROP TABLE [dbo].[tbl_dba_archive_Drive_Space];

	IF OBJECT_ID(N'tbl_dba_archive_dbsize', N'U') IS NOT NULL
	DROP TABLE [dbo].[tbl_dba_archive_dbsize];

	IF OBJECT_ID(N'usp_tbl_dba_archive_drive_space', N'P') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_tbl_dba_archive_drive_space];

	IF OBJECT_ID(N'usp_tbl_dba_archive_dbsize', N'P') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_tbl_dba_archive_dbsize];

	IF OBJECT_ID(N'databaseSize', N'P') IS NOT NULL
	DROP PROCEDURE [dbo].[databaseSize];



	--*******************************************************
	-- Drop Process Over for SQL Server 2008
	--*******************************************************
end

GO
print N'Dropping Existing Object Completed.'
print N'Creating Objects.............'
--*****************************************************************************
-- Starting Object Deployment
--*****************************************************************************
/****** Object:  Table [dbo].[tbl_dba_maintenance_history]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_maintenance_history](
	[xdatabase] [sysname] NOT NULL,
	[xfull] [char](1) NOT NULL,
	[xsequence] [int] NOT NULL,
	[xdiff] [char](1) NOT NULL,
	[xlog] [char](1) NOT NULL,
	[xcheckdb] [char](1) NOT NULL,
	[xreindex] [char](1) NOT NULL,
	[xupdatestats] [char](1) NOT NULL,
	[withsamplepercent] [varchar](25) NOT NULL,
	[xupdateusage] [char](1) NOT NULL,
	[create_dt] [datetime] NOT NULL,
	[drop_dt] [datetime] NOT NULL,
	[xskip] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_CheckVersion]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: 	Display Version Information for All Stored Procedures
Created on	:	12/13/2006
Modified on	: 	12/13/2006
Version		:	1.1
dependencies	:	Table						Procedure
					*************				******************
Usage		: 	DBA..usp_dba_CheckVersion 
				@ObjName = 'usp_dba_block_alert' -- Parameter is required only when Version info for individual object is required
***********************************************************************/

CREATE	PROCEDURE [dbo].[usp_dba_CheckVersion]
(
	@ObjName	sysname = NULL
) with encryption
as
SET NOCOUNT ON
	if @ObjName is NULL
	begin
		select object_name(id) [Procedure Name], substring(text, charindex(N'Version',text,1),15) [Version Info]
		from DBA..syscomments 
		where text like N'%Version%' and object_name(id)<>N'usp_dba_CheckVersion' and object_name(id) like N'usp%'
	end
	else
	begin
		select object_name(id) [Procedure Name], substring(text, charindex(N'Version',text,1),15) [Version Info]
		from DBA..syscomments 
		where  text like N'%Version%' and object_name(id)=@ObjName
	end	


GO
/****** Object:  Table [dbo].[tbl_dba_sqlagent_monitor]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_sqlagent_monitor](
	[server_name] [varchar](100) NULL,
	[date_time] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_block_tracker_batch]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_block_tracker_batch](
	[Batch_ID] [int] NULL,
	[Batch_Time] [datetime] NULL,
	[Alerted] [bit] NULL DEFAULT ((0)),
	[Block_Group] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_block_tracker]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_block_tracker](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[Batch_ID] [int] NULL,
	[spid] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_Drive_Space]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_Drive_Space](
	[Drive] [char](1) NOT NULL,
	[TotalSizeMB] [int] NULL,
	[FreeSpaceMB] [int] NULL,
	[FreeSpacePCT] [int] NULL,
	[FSDateStamp] [datetime] NULL,
	[ServerName] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_GSMID_Setting]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: Set GSM ID on all databases 
Created on	:	05/21/2007
Modified on	: 	05/21/2007
Version		:	1.1

Dependency	: Table
				tbl_dba_maintenance_config (if @vIgnoreDBA_DB is 'N')		  		  
usage:
	exec DBA..[usp_dba_GSMID_Setting] 	 


-----------------------------------------------------------------------------------------------------*/
CREATE procedure [dbo].[usp_dba_GSMID_Setting] 
(
	@vIgnoreDBA_DB	char(1) = N'N'
) with encryption
as
set nocount on
declare @username varchar(25), @dbName varchar(45)
set @username = N'dbmon_gsm'
declare @sql varchar(250)
declare @ver varchar(50)
select @ver = left(@@version,50)

if not exists(select 1 from master..syslogins where name=N'dbmon_gsm')
	if (CHARINDEX(N'2008',@ver, 1) > 0) OR (CHARINDEX(N'2012',@ver, 1) > 0)
		exec (N'CREATE LOGIN dbmon_gsm with Password =''dbmon_gsm@123#@!'', CHECK_POLICY = OFF')
	else
		exec (N'use master exec sp_addlogin ''dbmon_gsm'', ''dbmon_gsm''')

create table #tbl
(
	owner		varchar(100),
	object		varchar(100),
	grantee		varchar(100),
	grantor		varchar(100),
	protecttype	varchar(100),
	[action]	varchar(100),
	[column]	varchar(100),
)

insert into #tbl exec(N'sp_helprotect')

if exists(select 1 from #tbl where object = N'sysservers' and grantee = N'public' and protecttype = N'Deny')
	REVOKE  SELECT  ON [master]..[sysservers] FROM [public] CASCADE		

drop table #tbl

if @vIgnoreDBA_DB = N'N'
begin

	DECLARE curDB CURSOR FOR
		select xdatabase from DBA..tbl_dba_maintenance_config where xGSMSetting=N'Y' and drop_dt is NULL --name not in('tempdb')
end
else
begin

	DECLARE curDB CURSOR FOR
		select name from master..sysdatabases where UPPER(name) not in(N'TEMPDB')
end

		OPEN curDB

		FETCH NEXT FROM curDB into @dbName

		WHILE @@FETCH_STATUS = 0
		BEGIN
			select @ver = left(@@version,50)

			if (CHARINDEX(N'2000',@ver, 1) > 0 or CHARINDEX(N'2008',@ver, 1) > 0 or CHARINDEX(N'2012',@ver,1) > 0)
			begin
				if (databasepropertyex(@dbName,N'Status') = N'ONLINE' and databasepropertyex(@dbName,N'Updateability') <> N'READ_ONLY')
				begin

					set @sql = N'use [' + @dbName + N']'
					set @sql = @sql + N' if not exists(select 1 from sysusers where name = ''dbmon_gsm'') '
					set @sql = @sql + N' begin '
					set @sql = @sql + N' exec sp_grantdbaccess ''' + @username + N''', ''' + @username + N''''
					set @sql = @sql + N' exec sp_addrolemember ''db_datareader'', ''' + @username + N''''
					set @sql = @sql + N' end'

					exec(@sql)
				end
			end
			else
				if (databaseproperty(@dbName,N'IsOffline') = 0 and databaseproperty(@dbName,N'IsReadOnly') = 0)
				begin

					set @sql = N'use [' + @dbName + ']'
					set @sql = @sql + N' if not exists(select 1 from sysusers where name = ''dbmon_gsm'') '
					set @sql = @sql + N' begin '
					set @sql = @sql + N' exec sp_grantdbaccess ''' + @username + N''', ''' + @username + N''''
					set @sql = @sql + N' exec sp_addrolemember ''db_datareader'', ''' + @username + N''''
					set @sql = @sql + N' end'

					exec(@sql)
				end		

		FETCH NEXT FROM curDB into @dbName

		END

		CLOSE curDB

		DEALLOCATE curDB

GO

/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_maintenance_u]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: update database maintenance info in DBA..tbl_dba_maintenance_config 
Created on	:	10/12/2006
Modified on	: 	11/10/2006
Version		:	1.1
dependencies	: Table					
		  tbl_dba_maintenance_config			
		  		  
usage:
	exec DBA..usp_tbl_dba_maintenance_u 	 

-----------------------------------------------------------------------------------------------------*/
create procedure [dbo].[usp_tbl_dba_maintenance_u] with encryption
as
begin
set nocount on 
 
		--add new database to tbl_dba_maintenance_config 
declare @rowcount int; set @rowcount = 0
declare @xdatabase sysname

if exists( 
	select * from 	master..sysdatabases m1 
	left outer join DBA..tbl_dba_maintenance_config m2
		on 	m1.[name] 	= 	m2.[xdatabase]
     	where 		m2.[xdatabase] is null
	and 		m1.[name] not in (N'northwind',N'pubs'))
begin

	insert into DBA..tbl_dba_maintenance_config
     	([xdatabase],create_dt)
     	select 	[name]
		,crdate
	from 		master..sysdatabases m1 
     	left outer join DBA..tbl_dba_maintenance_config m2
		on 	m1.[name] = m2.[xdatabase]
     	where 		m2.[xdatabase] is null
	and 		m1.[name] not in (N'northwind',N'pubs')
	
	set @rowcount = @@rowcount
	
end
--****************************************************
--****************************************************
--update tbl_dba_FileGroup 

	declare curDBFG cursor for 
				select xdatabase from DBA..tbl_dba_maintenance_config
					where	xFileGroup = N'Y' and xMultiBkupPlan = N'N'
	open curDBFG

	fetch curDBFG into @xdatabase
	while @@fetch_status = 0
	begin

		insert into DBA..tbl_dba_BackupPlan_History
			select *, getdate() 		
					from DBA..tbl_dba_BackupPlan
					where  xdatabase = @xdatabase and xFileGroup is null

		delete t
		from DBA..tbl_dba_BackupPlan t
		where  t.xdatabase = @xdatabase and xFileGroup is null

		exec(N'insert into DBA..tbl_dba_BackupPlan(xdatabase,xFileGroup,xBkupType)
			select ''' + @xdatabase + ''',s1.groupname,''FULL'' from ' + @xdatabase + '..sysFileGroups s1
			 left outer join DBA..tbl_dba_BackupPlan s2 on s1.groupname = s2.xFileGroup
			where s2.xFileGroup is null')

		exec(N'insert into DBA..tbl_dba_BackupPlan(xdatabase,xFileGroup,xBkupType)
			select ''' + @xdatabase + ''',s1.groupname,''DIFF'' from ' + @xdatabase + '..sysFileGroups s1
			 left outer join DBA..tbl_dba_BackupPlan s2 on s1.groupname = s2.xFileGroup
			where s2.xFileGroup is null')
			
		fetch curDBFG into @xdatabase
	end
	close curDBFG
	deallocate curDBFG

--***************************************************
--****************************************************

--update Backup Plan 

	declare curBkPl cursor for 
				select xdatabase from DBA..tbl_dba_maintenance_config
					where	xMultiBkupPlan = N'Y' 
					and		xdatabase not in(select xdatabase from DBA..tbl_dba_BackupPlan where xFileGroup is null)
	open curBkPl

	fetch curBkPl into @xdatabase
	while @@fetch_status = 0
	begin
		insert into DBA..tbl_dba_BackupPlan_History
			select *, getdate() 		
					from DBA..tbl_dba_BackupPlan
					where  xdatabase = @xdatabase

		set @rowcount = @@rowcount
		if @rowcount > 0
		begin

			delete t
			from DBA..tbl_dba_BackupPlan t
			where  t.xdatabase = @xdatabase
			
			update tbl_dba_maintenance_config
			set xFileGroup = N'N'
			where xdatabase = @xdatabase

		end

		update tbl_dba_maintenance_config
		set xfull = N'N', xdiff = N'N'
		where xdatabase = @xdatabase
		
		insert into DBA..tbl_dba_BackupPlan(xdatabase,xBkupType) values(@xdatabase,N'FULL')
		insert into DBA..tbl_dba_BackupPlan(xdatabase,xBkupType) values(@xdatabase,N'DIFF')
			
		fetch curBkPl into @xdatabase

	end

	close curBkPl
	deallocate curBkPl


--*****************************************************

	update t
	set xlog = N'N'
	from DBA..tbl_dba_maintenance_config t,
		(select name from master..sysdatabases 
				where ltrim(convert(varchar,databasepropertyex(name,N'recovery'))) = N'SIMPLE'
				or name = N'DBA') t1
	where t.xdatabase = t1.name
	
	update t
	set xlog = N'Y'
	from DBA..tbl_dba_maintenance_config t,
		(select name from master..sysdatabases 
				where ltrim(convert(varchar,databasepropertyex(name,N'recovery'))) = N'FULL' or ltrim(convert(varchar,databasepropertyex(name,'recovery'))) = 'BULK_LOGGED'
				and name != N'DBA') t1
	where t.xdatabase in 
					(select xdatabase from tbl_dba_full_backup_completed
						where convert(varchar,starttime,102) = convert(varchar,dateadd(dd,-1,getdate()),102) 
							or convert(varchar,starttime,102) = convert(varchar,getdate(),102) 
					)
	and t.xdatabase = t1.name

	--Set xLog = 'N' for all primary logshipping databases 
	update t
	set xlog = N'N'
	from DBA..tbl_dba_maintenance_config t,
		(select name from master..sysdatabases sd
           inner join msdb..log_shipping_primary_databases ls
	       on ls.primary_database = sd.name) t1
	where t.xdatabase = t1.name


--****************************************************

	update t 
	set xskip = 0
	from DBA..tbl_dba_maintenance_config t,
		(select name from master..sysdatabases 
				where ltrim(convert(varchar,databasepropertyex(name,N'status'))) = N'ONLINE') t1
	where t.xdatabase = t1.name

	update t 
	set xskip = 1, drop_dt = getdate()
	from 	DBA..tbl_dba_maintenance_config t
	where 	t.xdatabase not in(select name from master..sysdatabases)

	update t 
	set xskip = 1
	from DBA..tbl_dba_maintenance_config t,
		(select name from master..sysdatabases 
				where	ltrim(convert(varchar,databasepropertyex(name,N'status'))) = N'OFFLINE' or 
						ltrim(convert(varchar,databasepropertyex(name,N'Updateability'))) = N'READ_ONLY' or 
						upper(name)=N'TEMPDB') t1
	where t.xdatabase = t1.name or xskipManual = 1

--*******************************************************

	update t 
	set xreindex = N'N'
	from DBA..tbl_dba_maintenance_config t,
		(select db_name(dbid) xdatabase, sum(ROUND((((size*8)/1024)/1024),0)) xSize from master..sysaltfiles 
				group by db_name(dbid)) t1
	where t.xdatabase = t1.xdatabase and t.xReindexLimit <= t1.xSize

	update t 
	set xreindex = N'Y'
	from DBA..tbl_dba_maintenance_config t,
		(select db_name(dbid) xdatabase, sum(ROUND((((size*8)/1024)/1024),0)) xSize from master..sysaltfiles 
				group by db_name(dbid)) t1
	where t.xdatabase = t1.xdatabase and t.xReindexLimit > t1.xSize and t1.xdatabase!=N'DBA'


	EXEC DBA..usp_dba_GSMID_Setting
end
GO
/****** Object:  StoredProcedure [dbo].[usp_dba_send_cdosysmail]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_dba_send_cdosysmail]
(
      @From    varchar(200),
      @To      nvarchar(2000),
      @CC      nvarchar(1000) = NULL,
      @BCC     nvarchar(1000) = NULL,
      @Subject nvarchar(200) = '',
      @Body    nvarchar(4000)= '',
	  @SMTPServer nvarchar(50), 
	  @Body1	nvarchar(4000) = ' ',
	  @Attachments nvarchar(4000) =''
) with encryption
AS
begin
	DECLARE @iMsg int
	DECLARE @hr int
	DECLARE @Source varchar(255)
	DECLARE @Description varchar(500)
	DECLARE @Output varchar(1000)
	Declare @filename nvarchar(250)
	declare @returnvalue int

	if charindex('Report',@Subject,1) = 0
		Select @Subject = @@ServerName + ':  ' +  @Subject

	if charindex('Reported',@Subject,1) != 0
		Select @Subject = @@ServerName + ':  ' +  @Subject

	-- Create the CDO.Message Object

	EXEC @hr = master.dbo.sp_OACreate 'CDO.Message', @iMsg OUT

	/*
	   Configuring the Message Object
   
	   This is to configure a remote SMTP server.
	   http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cdosys/html/_cdosys_schema_configuration_sendusing.asp
	   1 = LOCAL, 2 = REMOTE
	*/

	EXEC @hr = master.dbo.sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/sendusing").Value','2'

	/*
	   This is to configure the Server Name or IP address. 
	   Replace MailServerName by the name or IP of your SMTP Server. 
	   I set the IP for my LOCAL SMTP BOX
	*/

	EXEC @hr = master.dbo.sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/smtpserver").Value', @SMTPServer 

	-- Save the configurations to the message object.

	EXEC @hr = master.dbo.sp_OAMethod @iMsg, 'Configuration.Fields.Update', null

	-- Set the e-mail parameters.

	EXEC @hr = master.dbo.sp_OASetProperty @iMsg, 'To', @To
	EXEC @hr = master.dbo.sp_OASetProperty @iMsg, 'From', @From
	EXEC @hr = master.dbo.sp_OASetProperty @iMsg, 'CC', @CC
	EXEC @hr = master.dbo.sp_OASetProperty @iMsg, 'BCC',@BCC
	EXEC @hr = master.dbo.sp_OASetProperty @iMsg, 'Subject', @Subject

	--

	-- If you are using HTML e-mail, use 'HTMLBody' instead of 'TextBody'.
	--declare @Body2 text
	--set @Body2 = @Body + @Body1
	declare @vMsg varchar(100)
	set @vMsg = convert(varchar,@iMsg)

	IF @Body LIKE '%<HTML>%'
	begin
		--EXEC @hr = 
	--print 'master.dbo.sp_OASetProperty ' +  convert(varchar,@iMsg) + ',''HTMLBody'','''+ @Body + @Body1 + ''''
		exec('master.dbo.sp_OASetProperty ' +  @vMsg + ',''HTMLBody'','''+ @Body + @Body1 + '''')
	
		set @hr = 0
	end
	ELSE
	   EXEC @hr = master.dbo.sp_OASetProperty @iMsg, 'TextBody', @Body 

	print @Attachments
	IF @Attachments != ''
	begin


		while len(@Attachments) > 0
		begin

			if charindex(',',@Attachments,1) > 0
			begin
						set @filename = left(@Attachments, charindex(',',@Attachments,1)-1)
						set @Attachments = replace(@Attachments, @filename + ',','')
			end
			else
			begin
						set @filename = @Attachments
						set @Attachments = ''
			end
			EXEC @hr = master.dbo.sp_OAMethod @iMsg, 'AddAttachment',@returnvalue OUT, @filename
		end
	end

	EXEC @hr = master.dbo.sp_OAMethod @iMsg, 'Send', NULL
	-- Sample error handling.
	IF @hr <> 0 
	BEGIN
		  SELECT @hr
		  EXEC @hr = master.dbo.sp_OAGetErrorInfo NULL, @Source OUT, @Description OUT
		  IF @hr = 0
		  BEGIN
				SELECT @Output = '  Source: ' + @Source
				PRINT  @Output
				SELECT @Output = '  Description: ' + @Description
				PRINT  @Output
		  END
		  ELSE
		  BEGIN
			   PRINT '  master.dbo.sp_OAGetErrorInfo failed.'
			   RETURN
		  END
	END

	/*
	   Do some error handling after each step if you need to.
	   Clean up the objects created.
	*/
	EXEC @hr = master.dbo.sp_OADestroy @iMsg
end
GO

/****** Object:  StoredProcedure [dbo].[usp_dba_SendMail]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*******************************************************************************************

Purpose		: Call usp_dba_send_cdosysmail and provide all necessary information like 
				SMTP Server Detail, Subject, Body and compiles right Recepient 
				Address based on information (AlertType) available in tbl_dba_Alert_Config.
Created on	: 10/25/2006
Modified on : 10/28/2006
Version		: 1.2
dependencies:
				Table						Procedure
				tbl_dba_Alert_Config			usp_dba_send_cdosysmail
				tbl_dba_SMTPServer_Config
Usage		:
				usp_dba_SendMail 'Backup', @Subject = 'Success - Full Backup', @Body = 'Completed ..........'

Note		: Server Name gets automatically added in subject line.
*******************************************************************************************/

CREATE procedure [dbo].[usp_dba_SendMail]
(
	@JobType nvarchar(15),
	@Subject nvarchar(200),
	@Body	nvarchar(4000),
	@Body1	nvarchar(4000) = ' ',
	@Attachments nvarchar(4000)=''
) with encryption
		
AS
begin
DECLARE	@From    nvarchar(200),
			@To      nvarchar(2000),
			@CC      nvarchar(1000),
			@BCC     nvarchar(1000),
			@SMTPServer nvarchar(50),
			@vTktContent nvarchar(2500)

	Select @From = MailFrom, @SMTPServer = SMTPServer from DBA..tbl_dba_SMTPServer_Config

	if (@JobType = 'Backup')
	begin
			Select @To = EmailTo, @CC = EmailCC, @BCC = EmailBCC	from DBA..tbl_dba_Alert_Config where AlertType = @JobType

			if charindex('Success',@Subject,1) > 0
			begin
				Select @Body = @Body + char(13) + char(13)
				select @Body = @Body + 'Backup Location is: ' + db_full_bkup_location from DBA..tbl_dba_maint_file_location
				select @Body = @Body + char(13)+char(13) + 'Refer Folder : ' + @@Servername + ' at above location for detail'

			end	

			if charindex('Fail',@Subject,1) > 0
			begin
				
				Select @Body = @Body + char(13) + char(13) 
				Select @Body = @Body + '==============================================================' + char(13)
				Select @vTktContent = TextLine1 + char(13) + char(13) + TextLine2 + char(13) + char(13) + TextLine3 + char(13) + char(13) +
								TextLine4 + '"' + @Subject +' on ' + @@Servername + '"' + char(13) + char(13) + TextLine5 from DBA..tbl_dba_Ticket_Content

				Select @Body = @Body + @vTktContent + char(13) + char(13)
				Select @Body = @Body + '=============================================================='


			end	
					
	end
	else
			Select @To = EmailTo, @CC = EmailCC, @BCC = EmailBCC	from DBA..tbl_dba_Alert_Config where AlertType = @JobType

	if charindex('@',@To,1) = 0 or charindex('@',@To,1) is null
	begin
		raiserror ('Email cannot be sent without proper value configuration in DBA..tbl_dba_Alert_Config',16,1)
		return
	end

	--select charindex('@',@To,1)
	--set @Subject = @Subject --+ ' Test Mail (plz ignore - Mohan)'

	EXEC DBA..usp_dba_send_cdosysmail
		   @From      = @From
		  ,@To        = @To
		  ,@CC		  = @CC
		  ,@BCC		  = @BCC
		  ,@Subject   = @Subject
		  ,@Body      = @Body
		  ,@SMTPServer= @SMTPServer
		  ,@Body1	  = @Body1
		  ,@Attachments = @Attachments
end
GO

/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_FileGroup_backup]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: Run FileGroup backup based on database list from "tbl_dba_maintenance_config "
		  where value in column "xFileGroup" is "Y" considering schedule for every FileGroup
Created on	:	2/9/2007
Modified on	: 	2/9/2007
Version		:	1.1
dependencies	: Table					Procedure
		  tbl_dba_maintenance_config			usp_tbl_dba_maintenance_u
		  tbl_dba_FileGroup
Usage: 

exec DBA..usp_tbl_dba_FileGroup_backup
				  @database = 'DBA' 	--> mandatory
				 ,@FileGroup = 'DBA_Active' --> mandatory			
				 ,@directory = 'D:\MSSQL\Backup' --> (location for backup) 				-- optional IF path is set in tbl_dba_backup_location 
				 ,@sequence = 1 	--> (number of backup files to split)			-- optional (1 is the default)
				 ,@execute = 'N'	--> (execute backup('Y'),if 'N' then 			-- default is 'N'			
							     display the command)
				 ,@withstats = '	--> (display percentage of backup completed)		-- default is ''
				 ,@mkdir = 'Y'		--> (creates the backup directory path			-- default is 'Y'	

Note:	

If [@check] = 'Y'  - 	this will backup all databases in table "DBA..tbl_dba_maintenance_config" where  column "xfull" = 'Y'
			
--------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--usp_tbl_dba_FileGroup_backup 'DBA','Test','C:\Mohan',@execute='Y'

CREATE procedure [dbo].[usp_tbl_dba_FileGroup_backup]
(
	@database varchar(50),
	@FileGroup varchar(50),
	@directory varchar(100) = null,
	@sequence int = 1,
	@execute char(1) = 'N',
	@withstats varchar(20) = '',
	@mkdir char(1) = 'Y'
) with encryption
as
set nocount on

declare 	@sql varchar(5000),
        	@file_name varchar(100),
			@exec_md varchar(500),
			@error int,
			@sequenceloop int 	

set @sequenceloop = @sequence

declare @Compression char(1) = 'N';

if @directory is null select @directory = db_full_bkup_location from DBA..tbl_dba_maint_file_location

if right(@directory,1) = '\' select @directory = @directory + @@servername
else select @directory = @directory + '\' + @@servername

if @directory is null or len(@directory) < 1
begin
	 raiserror('A valid backup location (@directory) must be provided, or set the backup location in DBA..tbl_dba_backup_location',16,1)
	 return
end

if @database is not null
begin
	if right(@directory,1) <> '\' set @directory = @directory + '\'

	select 'FileGroup BACKUP' as 'Maintenance_Type', UPPER(@database) as 'Target_Database', 
		UPPER(@FileGroup) 'File_Group', convert(varchar(20),getdate(),9) as 'Date_Time'

	if @execute <> 'Y' select 'SET @execute = ''Y'' ' as '**To Perform FileGroup Backup**' 
	else
	begin

		set @sequence = @sequenceloop 
		
		if (databasepropertyex(@database,'status') <> 'ONLINE') or (databasepropertyex(@database,'status') is null)
		begin
			print  'database ' + @database + ' is invalid or database status is not online' 
		end
		else     
	  	begin

			set @sql = isnull(@sql,'') + 'backup database [' + @database + '] FileGroup = ''' + @FileGroup + ''' to '
			while @sequence > 0
			begin

				select @file_name = '_db_' +
			       	convert(char(4),datepart(yy,getdate()) )+
			       	replicate('0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
			       	replicate('0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
			       	replicate('0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
			       	replicate('0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
			       	+ convert(varchar(5),@sequence) + '.bak'	

				set @sql = @sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + replace(@FileGroup,' ','') + @file_name + ''''
				
				if @sequence > 1
					select @sql = @sql + ',' + char(13)
				
				Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database
				
				if @withstats != ''
					select @sql = @sql + ' with stats=' + @withstats					 
				
				if @Compression = 'Y'
				begin
					if @withstats != ''
						select @sql = @sql + ', compression'
					else
						select @sql = @sql + ' with compression'
				end

				set @sequence  = @sequence - 1
			
			end
	
			if @execute = 'N'
			begin
			   	select @sql as 'command to execute'
			end
			else
			begin	
				--create backup directory folders
				if @mkdir = 'Y'
				begin
					select @exec_md = 'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
--					print @exec_md
					exec (@exec_md)
				end
				--execute backup
--				print @sql
				exec (@sql)
			end
	  	end
	end
	select @sql = null--, @database = null
end
else
	raiserror ('Database name and File group name must be passed in order to perform file group backup operation',16,1)
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_dba_QueryFile]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: 	Read Text File and return all lines in form of table that can be used to match any particular 
			value for further processing.
Created on	:	09/04/2007
Modified on	: 	09/04/2007
Version		:	1.1
dependencies	:	FileSystemObject
							
Usage		: 	select * from ufn_dba_QueryFile ('C:\Documents and Settings\kumarm26\Desktop\dsmsched.log')
			where vLine like '%20070903%.bak%'

***********************************************************************/

CREATE function [dbo].[ufn_dba_QueryFile]
(
	@fileName	varchar(250) -- pass file name alongwith complete path
)
returns
@tblLineFound table
(
	nLine	numeric identity(1,1),
	vLine	varchar(8000)

) 
as
begin

	declare @oFileSystem int,@oTxtStream int,@oErrObj int,
		@vErrMsg varchar(2000),@vCmd varchar(2000),
		@ret int, @vLineFound varchar(8000),@flag int
	
	
	select @vErrMsg='opening the File System Object'
	EXECUTE @ret = sp_OACreate  'Scripting.FileSystemObject' , @oFileSystem OUT
	
	if @ret=0 
		select @oErrObj=@oFileSystem, @vErrMsg='Opening file "'+ @fileName+'"',@vCmd=@fileName
	
	if @ret=0 
		exec @ret = sp_OAMethod   @oFileSystem  , 'OpenTextFile', @oTxtStream OUT, @vCmd,1,false,0
	
	while @ret=0
	begin
		if @ret=0 
			select @oErrObj=@oTxtStream, @vErrMsg='finding out if there is more to read in "'+@fileName+'"'
	
		if @ret=0 
			exec @ret = sp_OAGetProperty @oTxtStream, 'AtEndOfStream', @flag OUTPUT
	
		if @flag<>0
			break
	
		if @ret=0 
			select @oErrObj=@oTxtStream, @vErrMsg='reading from the output file "'+@fileName+'"'
	
		if @ret=0 
			exec @ret = sp_OAMethod  @oTxtStream, 'Readline', @vLineFound OUTPUT
	
		insert into @tblLineFound (vLine) select @vLineFound
	
	end
	
	if @ret=0
		select @oErrObj = @oTxtStream, @vErrMsg = 'closing the output file "' + @fileName + '"'
	
	if @ret=0 
		exec @ret = sp_OAMethod  @oTxtStream, 'Close'

	exec  sp_OADestroy @oTxtStream
	return
end


GO
/****** Object:  Table [dbo].[tbl_dba_TSMLog]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_TSMLog](
	[nSNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BackupTime] [datetime] NULL,
	[FilePath] [varchar](500) NULL,
	[FName] [varchar](500) NULL,
	[BackupType] [char](3) NULL,
	[Status] [varchar](20) NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_FileGroup]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_FileGroup](
	[xdatabase] [sysname] NOT NULL,
	[xFileGroup] [sysname] NOT NULL,
	[xDaily] [char](1) NULL CONSTRAINT [DF_tbl_dba_FileGroup_xDaily]  DEFAULT ('N'),
	[xWeekly] [varchar](7) NULL CONSTRAINT [DF_tbl_dba_FileGroup_xWeekly]  DEFAULT ('1,2,3,4'),
	[xWDayName] [varchar](100) NULL CONSTRAINT [DF_tbl_dba_FileGroup_xWDayName]  DEFAULT ('Friday'),
	[xMonthly] [char](1) NULL CONSTRAINT [DF_tbl_dba_FileGroup_xMonthly]  DEFAULT ('N'),
	[xWOfMonth] [char](1) NULL,
	[xMDayName] [varchar](20) NULL CONSTRAINT [DF_tbl_dba_FileGroup_xMDayName]  DEFAULT ('Friday'),
	[xSequence] [int] NULL CONSTRAINT [DF_tbl_dba_FileGroup_xSequence]  DEFAULT ((1))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_TSMReport_Config]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_TSMReport_Config](
	[BackupType] [char](3) NULL,
	[Display] [char](1) NULL CONSTRAINT [DF__tbl_dba_T__Displ__4BAC3F29]  DEFAULT ('N'),
 CONSTRAINT [IX_tbl_dba_TSMReport_Config] UNIQUE NONCLUSTERED 
(
	[BackupType] ASC
) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_Monitor_SQLService]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_Monitor_SQLService](
	[nSno] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ServerName_IP] [varchar](25) NOT NULL,
	[StatusTime] [datetime] NOT NULL,
	[vStatus] [varchar](40) NOT NULL,
	[ServiceName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_tbl_dba_SQLService_Monitor] PRIMARY KEY CLUSTERED 
(
	[nSno] ASC
) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_Monitor_SQLService]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************

Purpose		: Monitor SQL Services for specified server(s) 
Created on	: 11/28/2006
Modified on 	: 11/28/2006
Version		: 1.1
dependencies:
				Table						Procedure
				tbl_dba_Monitor_SQLService
*******************************************************************************************/
--usp_dba_Monitor_SQLService '10.204.228.137,10.204.228.137\CCECMS_ED,10.204.228.137\CCECMS_TST,10.204.228.137\mk'

CREATE procedure [dbo].[usp_dba_Monitor_SQLService]
(
	@ServerName varchar(1000) = '' -- Provide Server Name or IP Address 
) with encryption
as

declare @SrvName varchar(25), @Subject varchar(100), @Body varchar(100), @exitMonitor char(1)
declare @AgentServiceName varchar(25), @SQLServiceName varchar(25)


if left(@ServerName,1) != ','
	set @ServerName = @ServerName + ','

create table #tblOutput
(
	vOutput	varchar(1000)
)
set nocount on

while len(@ServerName) > 0
begin
	set @exitMonitor = 'N'

	set @SrvName = left(@ServerName, charindex(',',@ServerName,1)-1)
	set @ServerName = replace(@ServerName, @SrvName + ',','')
	if charindex ('\',@SrvName, 1) > 0 
	begin
		set @AgentServiceName	 = 'SQLAGENT$' + right(@SrvName,len(@SrvName) - charindex ('\',@SrvName, 1))
		set @SQLServiceName	 = 'MSSQL$' + right(@SrvName,len(@SrvName) - charindex ('\',@SrvName, 1))
		set @SrvName	= left(@SrvName,charindex ('\',@SrvName, 1)-1)
	end
	else
	begin
		set @AgentServiceName 	= 'SQLSERVERAGENT'
		set @SQLServiceName	= 'MSSQLSERVER'
	end

	insert into #tblOutput(vOutput) exec('master..xp_cmdshell ''sc \\' + @SrvName + '  query ' + @AgentServiceName + '''')

	if not exists(select 1 from #tblOutput where vOutput like '%RUNNING%')
	begin
		insert into tbl_dba_Monitor_SQLService (Servername_IP,StatusTime, vStatus, ServiceName)
				select @SrvName, getdate(), convert(varchar(40),ltrim(rtrim(vOutput))),@AgentServiceName from #tblOutput where vOutput like '%STAT%'

		if exists(select 1 from #tblOutput where vOutput like '%The RPC server is unavailable%')
		begin
			set @exitMonitor = 'Y'
			set @Subject = @SrvName + ' : Service Status can not be determined (Critical Report)'
			set @Body = 'The RPC server is unavailable as on ' + convert(varchar,getdate())
		end 
		else
		begin
			set @Subject = @SrvName + ' ' + @AgentServiceName + ' : SQL Server Agent not running (Critical Report)'
			select @Body	= replace(convert(varchar(40),ltrim(rtrim(vOutput))),'STATE','STATUS') + ' at ' + convert(varchar,getdate()) from #tblOutput where vOutput like '%STAT%'
		end		
		exec DBA..usp_dba_SendMail 'ServiceReport', @Subject, @Body
	end
	truncate table #tblOutput
	if @exitMonitor = 'N'
	begin
		insert into #tblOutput(vOutput) exec('master..xp_cmdshell ''sc \\' + @SrvName + '  query ' + @SQLServiceName + '''')
		
		if not exists(select 1 from #tblOutput where vOutput like '%RUNNING%')
		begin
			insert into tbl_dba_Monitor_SQLService (Servername_IP,StatusTime, vStatus, ServiceName)
					select @SrvName, getdate(), convert(varchar(40),ltrim(rtrim(vOutput))),@SQLServiceName from #tblOutput where vOutput like '%STAT%'
			
			set @Subject = @SrvName + ' ' + @SQLServiceName + ' : SQL Server Service is not running (Critical Report)'
			select @Body	= replace(convert(varchar(40),ltrim(rtrim(vOutput))),'STATE','STATUS') + ' at ' + convert(varchar,getdate()) from #tblOutput where vOutput like '%STAT%'
			
			exec DBA..usp_dba_SendMail 'ServiceReport', @Subject, @Body
		end
		truncate table #tblOutput
	end
end
drop table #tblOutput





GO
/****** Object:  Table [dbo].[tbl_dba_BackupPlan]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_BackupPlan](
	[xdatabase] [sysname] NOT NULL,
	[xFileGroup] [sysname] NULL,
	[xDaily] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_BackupPlan_xDaily]  DEFAULT ('N'),
	[xWeekly] [varchar](7) NULL CONSTRAINT [DF_tbl_dba_BackupPlan_xWeekly]  DEFAULT ('1,2,3,4'),
	[xWDayName] [varchar](100) NULL CONSTRAINT [DF_tbl_dba_BackupPlan_xWDayName]  DEFAULT ('Friday'),
	[xMonthly] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_BackupPlan_xMonthly]  DEFAULT ('N'),
	[xWOfMonth] [char](1) NULL CONSTRAINT [DF_tbl_dba_BackupPlan_xWOfMonth]  DEFAULT ((1)),
	[xMDayName] [varchar](20) NULL CONSTRAINT [DF_tbl_dba_BackupPlan_xMDayName]  DEFAULT ('Friday'),
	[xSequence] [int] NULL CONSTRAINT [DF_tbl_dba_BackupPlan_xSequence]  DEFAULT ((1)),
	[xBkupType] [char](4) NOT NULL CONSTRAINT [DF_tbl_dba_BackupPlan_xBkupType]  DEFAULT ('Full')
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_block_record]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Description	: 	This stored procedure will record blocking and return status in 0 or 1
Created on	:	
Modified on	:	10/14/2006
Version		:	1.1
Dependencies:
				Table							Procedure
				*******							**********


----------------------------------------------------------------------------------------------------------------------------*/

CREATE Procedure [dbo].[usp_dba_block_record]
(
 @latch int = 0, @fast int = 0, @block_occurred_bit bit output
) with encryption 
as
set nocount on
	declare @spid varchar(6), @dbid smallint, @hostname nchar(128),
			@program_name nchar(128), @loginame nchar(128), @blocked varchar(6),
			@Rec_ID int, @Batch_ID int, @status nchar(30), @open_tran smallint,
			@cpu int, @physical_io int, @memusage int, @nt_username nchar(128),
			@uid smallint, @time datetime, @time2 datetime, @time3 datetime

	set @time = getdate()

	--select spid, ecid, blocked, waittype, dbid into #probclients from master..sysprocesses where blocked!=0 or waittype != 0x0000

	select spid, hostname, program_name, loginame, ecid, blocked, waittype, dbid
	into #probclients 
	from master..sysprocesses where (blocked!=0 or waittype != 0x0000)
					and spid!=blocked--Checking for self blocking due to SP4

	create unique clustered index pc on #probclients (blocked, spid, ecid)
	set @time3 = getdate()

	if exists (select spid from #probclients where waittype != 0x020B)
	begin
	   set @time2 = getdate()
	   print ''
	   print ' Start time: ' + convert(varchar(26), @time, 121) + ' ' + convert(varchar(12), datediff(ms,@time,@time2)) + ' ' + convert(varchar(12), datediff(ms,@time,@time3))
	   
	   insert #probclients select distinct blocked, hostname, program_name, loginame, 0, 0, 0x0000, 0
									from #probclients
									where blocked not in (select spid from #probclients) and blocked != 0
	   if (@fast = 1)
	   begin
		  print ''
		  print 'SYSPROCESSES'
		  select spid, status, blocked, open_tran, waitresource, waittype, 
			 waittime, cmd, lastwaittype, cpu, physical_io,
			 memusage,last_batch=convert(varchar(26), last_batch,121),
			 login_time=convert(varchar(26), login_time,121), net_address,
			 net_library,dbid, ecid, kpid, hostname,hostprocess,
			 loginame,program_name, nt_domain, nt_username, uid, sid
		  from master..sysprocesses
		  where (blocked!=0 or waittype != 0x0000
			 or spid in (select blocked from #probclients where blocked != 0)
			 or spid in (select spid from #probclients where blocked != 0))
		and spid!=blocked
		  print 'ESP ' + convert(varchar(12), datediff(ms,@time2,getdate())) 
		  print ''
		  print 'spids at the head of blocking chains'
		  if exists(select blocked from #probclients where blocked != 0)
		  begin
			 select spid from #probclients
			 where blocked = 0 and spid in (select blocked from #probclients where spid != 0)
			 if @latch = 0
			 begin
				print ''
				print 'SYSLOCKINFO'
				set @time2 = getdate()
				select spid = convert (smallint, req_spid),
				   ecid = convert (smallint, req_ecid),
				   rsc_dbid As dbid,
				   rsc_objid As ObjId,
				   rsc_indid As IndId,
				   Type = case rsc_type when 1 then 'NUL'
										when 2 then 'DB'
										when 3 then 'FIL'
										when 4 then 'IDX'
										when 5 then 'TAB'
										when 6 then 'PAG'
										when 7 then 'KEY'
										when 8 then 'EXT'
										when 9 then 'RID' end,
				   Resource = substring (rsc_text, 1, 16),
				   Mode = case req_mode + 1 when 1 then NULL
											when 2 then 'Sch-S'
											when 3 then 'Sch-M'
											when 4 then 'IS'
											when 5 then 'SIU'
											when 6 then 'IS-S'
											when 7 then 'IX'
											when 8 then 'SIX'
											when 9 then 'S'
											when 10 then 'U'
											when 11 then 'IIn-Nul'
											when 12 then 'IS-X'
											when 13 then 'IU'
											when 14 then 'IS-U'
											when 15 then 'X'
											when 16 then 'BU' end,
				   Status = case req_status when 1 then 'GRANT'
											when 2 then 'CNVT'
											when 3 then 'WAIT' end
				from master.dbo.syslockinfo s,
				   #probclients p
				where p.spid = s.req_spid
				print 'ESL ' + convert(varchar(12), datediff(ms,@time2,getdate())) 
			 end -- latch not set
		  end -- blocking via locks
		  else
			 print 'No blocking via locks at ' + convert(varchar(26), @time, 121)
	   end  -- fast set
	   else  
	   begin  -- Fast not set
		  print ''
		  print 'SYSPROCESSES'
		  select spid, status, blocked, open_tran, waitresource, waittype, 
			 waittime, cmd, lastwaittype, cpu, physical_io,
			 memusage,last_batch=convert(varchar(26), last_batch,121),
			 login_time=convert(varchar(26), login_time,121), net_address,
			 net_library,dbid, ecid, kpid, hostname,hostprocess,
			 loginame,program_name, nt_domain, nt_username, uid, sid
		  from master..sysprocesses
		  print 'ESP ' + convert(varchar(12), datediff(ms,@time2,getdate())) 
		  print ''
		  print 'spids at the head of blocking chains'
		  if exists(select blocked from #probclients where blocked != 0)
		  begin 
			 select spid from #probclients
			 where blocked = 0 and spid in (select blocked from #probclients where spid != 0)
			 if @latch = 0 
			 begin
				print ''
				print 'SYSLOCKINFO'
				set @time2 = getdate()
				select spid = convert (smallint, req_spid),
				   ecid = convert (smallint, req_ecid),
				   rsc_dbid As dbid,
				   rsc_objid As ObjId,
				   rsc_indid As IndId,
				   Type = case rsc_type when 1 then 'NUL'
										when 2 then 'DB'
										when 3 then 'FIL'
										when 4 then 'IDX'
										when 5 then 'TAB'
										when 6 then 'PAG'
										when 7 then 'KEY'
										when 8 then 'EXT'
										when 9 then 'RID' end,
				   Resource = substring (rsc_text, 1, 16),
				   Mode = case req_mode + 1 when 1 then NULL
											when 2 then 'Sch-S'
											when 3 then 'Sch-M'
											when 4 then 'IS'
											when 5 then 'SIU'
											when 6 then 'IS-S'
											when 7 then 'IX'
											when 8 then 'SIX'
											when 9 then 'S'
											when 10 then 'U'
											when 11 then 'IIn-Nul'
											when 12 then 'IS-X'
											when 13 then 'IU'
											when 14 then 'IS-U'
											when 15 then 'X'
											when 16 then 'BU' end,
				   Status = case req_status when 1 then 'GRANT'
											when 2 then 'CNVT'
											when 3 then 'WAIT' end
				from master.dbo.syslockinfo
				print 'ESL ' + convert(varchar(12), datediff(ms,@time2,getdate())) 
			 end -- latch not set
		  end
		  else
			 print 'No blocking via locks at ' + convert(varchar(26), @time, 121)
	   end -- Fast not set
	   print ''
	   print 'DBCC SQLPERF(WAITSTATS)'
	   dbcc sqlperf(waitstats)
	   print ''
	   dbcc traceon(3604)
	   Print ''
	   Print ''
	   Print '*********************************************************************'
	   Print 'Print out DBCC INPUTBUFFER for all blocked or blocking spids.'
	   Print 'Print out DBCC PSS info only for spids at the head of blocking chains'
	   Print '*********************************************************************'
	   declare ibuffer cursor fast_forward for
	   select cast (spid as varchar(6)) as spid, cast (blocked as varchar(6)) as blocked
	   from #probclients
	   where (spid <> @@spid) and (blocked!=0
	--      or (waittype != 0x0000 and @latch = 1)
		  or (waittype != 0x0000 and @latch = 1 )
		  or spid in (select blocked from #probclients where blocked != 0))
	   open ibuffer
	   fetch next from ibuffer into @spid, @blocked--, @dbid, @hostname, @program_name, @loginame
	   while (@@fetch_status != -1)
	   begin
		  print ''
		  print ''
		  exec ('print ''DBCC INPUTBUFFER FOR spid ' + @spid + '''')
		  exec ('dbcc inputbuffer (' + @spid + ')')
		  print ''
		  fetch next from ibuffer into @spid, @blocked--, @dbid, @hostname, @program_name, @loginame
	   end
	   dbcc traceoff(3604)
	   deallocate ibuffer
	   Print ''
	   Print ''
	   Print '*******************************************************************************'
	   Print 'Print out DBCC OPENTRAN for active databases for all blocked or blocking spids.'
	   Print '*******************************************************************************'
	   declare ibuffer cursor fast_forward for
	   select distinct cast (dbid as varchar(6)) from #probclients
	   where dbid != 0
	   open ibuffer
	   fetch next from ibuffer into @spid
	   while (@@fetch_status != -1)
	   begin
		  print ''
		  print ''
		  exec ('print ''DBCC OPENTRAN FOR DBID ' + @spid + '''')
		  exec ('dbcc opentran (' + @spid + ')')
		  print ''
		  if @spid = '2' select @blocked = 'Y'
		  fetch next from ibuffer into @spid
	   end
	   deallocate ibuffer
	   if @blocked != 'Y' 
	   begin
		  print ''
		  print ''
		  print 'DBCC OPENTRAN FOR tempdb database'

	   end
	   print ''
	   print 'End time: ' + convert(varchar(26), getdate(), 121)
	end -- All


GO
/****** Object:  Table [dbo].[tbl_dba_maint_file_location]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_maint_file_location](
	[db_full_bkup_location] [varchar](150) NOT NULL,
	[db_diff_bkup_location] [varchar](150) NULL,
	[db_tran_bkup_location] [varchar](150) NOT NULL,
	[db_job_output_location] [varchar](150) NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_StopTrace]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************

Purpose		: Stop Trace if it is running
Created on	: 
Modified By : Mohan Kumar
Modified on : 10/26/2006
Version		: 1.1
dependencies:
				Table						Procedure
				********					**********
			
*******************************************************************************************/
CREATE Procedure [dbo].[usp_dba_StopTrace]
with encryption 
as
	DECLARE @TraceID int
	DECLARE @Off int 
	set  @Off = 0
	DECLARE @Close int 
	set  @Close = 2

	DECLARE Trace_curs CURSOR FORWARD_ONLY
	FOR
		SELECT DISTINCT traceid 
				FROM :: fn_trace_getinfo(default) where traceid > 1
	OPEN Trace_curs
	FETCH NEXT FROM Trace_curs INTO @TraceID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		exec sp_trace_setstatus @TraceID, @Off
		exec sp_trace_setstatus @TraceID, @Close

		FETCH NEXT FROM Trace_curs INTO @TraceID
	END
	CLOSE Trace_curs
	DEALLOCATE Trace_curs

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_StartTrace]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************

Purpose		: Start Trace
Created on	: 
Modified By	: Mohan Kumar
Modified on : 12/18/2006
Version		: 1.1
dependencies:
				Table						Procedure
				*************				**************
				
*******************************************************************************************/


CREATE PROCEDURE [dbo].[usp_dba_StartTrace] 
	@v_db_name varchar(255) = '',
	--@v_dbid int = 5, -- #MK# it has been commented because dbid will be picked automatically.
	@v_dirname varchar(255) = 'F:',
	@maxfilesize bigint = 200,
	@v_duration bigint = 100,
	@rolloveroption int = 2	-- set to 2 to turn it on
	with encryption
AS
-- Create a Queue

-- Please replace the text InsertFileNameHere, with an appropriate
-- filename prefixed by a path, e.g., c:\MyFolder\MyTrace. The .trc extension
-- will be appended to the filename automatically. If you are writing from
-- remote server to local drive, please use UNC path and make sure server has
-- write access to your network share
declare @v_dbid int
	if @v_db_name != ''
		select @v_dbid = dbid from master..sysdatabases where name=@v_db_name
	
	-- Create a Queue
	declare @rc int
	declare @TraceID int
	-- declare @maxfilesize bigint
	-- set @maxfilesize = 50
	declare @filename nvarchar(150)
	set	@v_dirname = @v_dirname + '\PSDBA\Trace\'
	-- create Trace Folder
	exec ('master..xp_cmdshell ''mkdir ' + @v_dirname + ', no_output''')
	
	--set trace filename
	set @filename = @v_dirname +  replace(@@servername,'\','_') + '_' + @v_db_name + '_' + replace(convert(varchar(19),getdate(),100),':','.') 
	
	PRINT @filename


	exec @rc = sp_trace_create @TraceID output, @rolloveroption, @filename, @maxfilesize, NULL 
	if (@rc != 0) goto error

	-- Client side File and Table cannot be scripted

	-- Set the events
	declare @on bit
	set @on = 1
	exec sp_trace_setevent @TraceID, 10, 1, @on
	exec sp_trace_setevent @TraceID, 10, 3, @on
	exec sp_trace_setevent @TraceID, 10, 6, @on
	exec sp_trace_setevent @TraceID, 10, 9, @on
	exec sp_trace_setevent @TraceID, 10, 10, @on
	exec sp_trace_setevent @TraceID, 10, 11, @on
	exec sp_trace_setevent @TraceID, 10, 12, @on
	exec sp_trace_setevent @TraceID, 10, 13, @on
	exec sp_trace_setevent @TraceID, 10, 14, @on
	exec sp_trace_setevent @TraceID, 10, 15, @on
	exec sp_trace_setevent @TraceID, 10, 16, @on
	exec sp_trace_setevent @TraceID, 10, 17, @on
	exec sp_trace_setevent @TraceID, 10, 18, @on
	exec sp_trace_setevent @TraceID, 10, 23, @on
	exec sp_trace_setevent @TraceID, 12, 1, @on
	exec sp_trace_setevent @TraceID, 12, 3, @on
	exec sp_trace_setevent @TraceID, 12, 6, @on
	exec sp_trace_setevent @TraceID, 12, 9, @on
	exec sp_trace_setevent @TraceID, 12, 10, @on
	exec sp_trace_setevent @TraceID, 12, 11, @on
	exec sp_trace_setevent @TraceID, 12, 12, @on
	exec sp_trace_setevent @TraceID, 12, 13, @on
	exec sp_trace_setevent @TraceID, 12, 14, @on
	exec sp_trace_setevent @TraceID, 12, 15, @on
	exec sp_trace_setevent @TraceID, 12, 16, @on
	exec sp_trace_setevent @TraceID, 12, 17, @on
	exec sp_trace_setevent @TraceID, 12, 18, @on
	exec sp_trace_setevent @TraceID, 12, 23, @on
	exec sp_trace_setevent @TraceID, 13, 1, @on
	exec sp_trace_setevent @TraceID, 13, 3, @on
	exec sp_trace_setevent @TraceID, 13, 6, @on
	exec sp_trace_setevent @TraceID, 13, 9, @on
	exec sp_trace_setevent @TraceID, 13, 10, @on
	exec sp_trace_setevent @TraceID, 13, 11, @on
	exec sp_trace_setevent @TraceID, 13, 12, @on
	exec sp_trace_setevent @TraceID, 13, 13, @on
	exec sp_trace_setevent @TraceID, 13, 14, @on
	exec sp_trace_setevent @TraceID, 13, 15, @on
	exec sp_trace_setevent @TraceID, 13, 16, @on
	exec sp_trace_setevent @TraceID, 13, 17, @on
	exec sp_trace_setevent @TraceID, 13, 18, @on
	exec sp_trace_setevent @TraceID, 13, 23, @on
	exec sp_trace_setevent @TraceID, 14, 1, @on
	exec sp_trace_setevent @TraceID, 14, 3, @on
	exec sp_trace_setevent @TraceID, 14, 6, @on
	exec sp_trace_setevent @TraceID, 14, 9, @on
	exec sp_trace_setevent @TraceID, 14, 10, @on
	exec sp_trace_setevent @TraceID, 14, 11, @on
	exec sp_trace_setevent @TraceID, 14, 12, @on
	exec sp_trace_setevent @TraceID, 14, 13, @on
	exec sp_trace_setevent @TraceID, 14, 14, @on
	exec sp_trace_setevent @TraceID, 14, 15, @on
	exec sp_trace_setevent @TraceID, 14, 16, @on
	exec sp_trace_setevent @TraceID, 14, 17, @on
	exec sp_trace_setevent @TraceID, 14, 18, @on
	exec sp_trace_setevent @TraceID, 14, 23, @on
	exec sp_trace_setevent @TraceID, 15, 1, @on
	exec sp_trace_setevent @TraceID, 15, 3, @on
	exec sp_trace_setevent @TraceID, 15, 6, @on
	exec sp_trace_setevent @TraceID, 15, 9, @on
	exec sp_trace_setevent @TraceID, 15, 10, @on
	exec sp_trace_setevent @TraceID, 15, 11, @on
	exec sp_trace_setevent @TraceID, 15, 12, @on
	exec sp_trace_setevent @TraceID, 15, 13, @on
	exec sp_trace_setevent @TraceID, 15, 14, @on
	exec sp_trace_setevent @TraceID, 15, 15, @on
	exec sp_trace_setevent @TraceID, 15, 16, @on
	exec sp_trace_setevent @TraceID, 15, 17, @on
	exec sp_trace_setevent @TraceID, 15, 18, @on
	exec sp_trace_setevent @TraceID, 15, 23, @on
	exec sp_trace_setevent @TraceID, 17, 1, @on
	exec sp_trace_setevent @TraceID, 17, 3, @on
	exec sp_trace_setevent @TraceID, 17, 6, @on
	exec sp_trace_setevent @TraceID, 17, 9, @on
	exec sp_trace_setevent @TraceID, 17, 10, @on
	exec sp_trace_setevent @TraceID, 17, 11, @on
	exec sp_trace_setevent @TraceID, 17, 12, @on
	exec sp_trace_setevent @TraceID, 17, 13, @on
	exec sp_trace_setevent @TraceID, 17, 14, @on
	exec sp_trace_setevent @TraceID, 17, 15, @on
	exec sp_trace_setevent @TraceID, 17, 16, @on
	exec sp_trace_setevent @TraceID, 17, 17, @on
	exec sp_trace_setevent @TraceID, 17, 18, @on
	exec sp_trace_setevent @TraceID, 17, 23, @on
	exec sp_trace_setevent @TraceID, 25, 1, @on
	exec sp_trace_setevent @TraceID, 25, 3, @on
	exec sp_trace_setevent @TraceID, 25, 6, @on
	exec sp_trace_setevent @TraceID, 25, 9, @on
	exec sp_trace_setevent @TraceID, 25, 10, @on
	exec sp_trace_setevent @TraceID, 25, 11, @on
	exec sp_trace_setevent @TraceID, 25, 12, @on
	exec sp_trace_setevent @TraceID, 25, 13, @on
	exec sp_trace_setevent @TraceID, 25, 14, @on
	exec sp_trace_setevent @TraceID, 25, 15, @on
	exec sp_trace_setevent @TraceID, 25, 16, @on
	exec sp_trace_setevent @TraceID, 25, 17, @on
	exec sp_trace_setevent @TraceID, 25, 18, @on
	exec sp_trace_setevent @TraceID, 25, 23, @on
	exec sp_trace_setevent @TraceID, 27, 1, @on
	exec sp_trace_setevent @TraceID, 27, 3, @on
	exec sp_trace_setevent @TraceID, 27, 6, @on
	exec sp_trace_setevent @TraceID, 27, 9, @on
	exec sp_trace_setevent @TraceID, 27, 10, @on
	exec sp_trace_setevent @TraceID, 27, 11, @on
	exec sp_trace_setevent @TraceID, 27, 12, @on
	exec sp_trace_setevent @TraceID, 27, 13, @on
	exec sp_trace_setevent @TraceID, 27, 14, @on
	exec sp_trace_setevent @TraceID, 27, 15, @on
	exec sp_trace_setevent @TraceID, 27, 16, @on
	exec sp_trace_setevent @TraceID, 27, 17, @on
	exec sp_trace_setevent @TraceID, 27, 18, @on
	exec sp_trace_setevent @TraceID, 27, 23, @on
	exec sp_trace_setevent @TraceID, 34, 1, @on
	exec sp_trace_setevent @TraceID, 34, 3, @on
	exec sp_trace_setevent @TraceID, 34, 6, @on
	exec sp_trace_setevent @TraceID, 34, 9, @on
	exec sp_trace_setevent @TraceID, 34, 10, @on
	exec sp_trace_setevent @TraceID, 34, 11, @on
	exec sp_trace_setevent @TraceID, 34, 12, @on
	exec sp_trace_setevent @TraceID, 34, 13, @on
	exec sp_trace_setevent @TraceID, 34, 14, @on
	exec sp_trace_setevent @TraceID, 34, 15, @on
	exec sp_trace_setevent @TraceID, 34, 16, @on
	exec sp_trace_setevent @TraceID, 34, 17, @on
	exec sp_trace_setevent @TraceID, 34, 18, @on
	exec sp_trace_setevent @TraceID, 34, 23, @on
	exec sp_trace_setevent @TraceID, 37, 1, @on
	exec sp_trace_setevent @TraceID, 37, 3, @on
	exec sp_trace_setevent @TraceID, 37, 6, @on
	exec sp_trace_setevent @TraceID, 37, 9, @on
	exec sp_trace_setevent @TraceID, 37, 10, @on
	exec sp_trace_setevent @TraceID, 37, 11, @on
	exec sp_trace_setevent @TraceID, 37, 12, @on
	exec sp_trace_setevent @TraceID, 37, 13, @on
	exec sp_trace_setevent @TraceID, 37, 14, @on
	exec sp_trace_setevent @TraceID, 37, 15, @on
	exec sp_trace_setevent @TraceID, 37, 16, @on
	exec sp_trace_setevent @TraceID, 37, 17, @on
	exec sp_trace_setevent @TraceID, 37, 18, @on
	exec sp_trace_setevent @TraceID, 37, 23, @on
	exec sp_trace_setevent @TraceID, 38, 1, @on
	exec sp_trace_setevent @TraceID, 38, 3, @on
	exec sp_trace_setevent @TraceID, 38, 6, @on
	exec sp_trace_setevent @TraceID, 38, 9, @on
	exec sp_trace_setevent @TraceID, 38, 10, @on
	exec sp_trace_setevent @TraceID, 38, 11, @on
	exec sp_trace_setevent @TraceID, 38, 12, @on
	exec sp_trace_setevent @TraceID, 38, 13, @on
	exec sp_trace_setevent @TraceID, 38, 14, @on
	exec sp_trace_setevent @TraceID, 38, 15, @on
	exec sp_trace_setevent @TraceID, 38, 16, @on
	exec sp_trace_setevent @TraceID, 38, 17, @on
	exec sp_trace_setevent @TraceID, 38, 18, @on
	exec sp_trace_setevent @TraceID, 38, 23, @on
	exec sp_trace_setevent @TraceID, 40, 1, @on
	exec sp_trace_setevent @TraceID, 40, 3, @on
	exec sp_trace_setevent @TraceID, 40, 6, @on
	exec sp_trace_setevent @TraceID, 40, 9, @on
	exec sp_trace_setevent @TraceID, 40, 10, @on
	exec sp_trace_setevent @TraceID, 40, 11, @on
	exec sp_trace_setevent @TraceID, 40, 12, @on
	exec sp_trace_setevent @TraceID, 40, 13, @on
	exec sp_trace_setevent @TraceID, 40, 14, @on
	exec sp_trace_setevent @TraceID, 40, 15, @on
	exec sp_trace_setevent @TraceID, 40, 16, @on
	exec sp_trace_setevent @TraceID, 40, 17, @on
	exec sp_trace_setevent @TraceID, 40, 18, @on
	exec sp_trace_setevent @TraceID, 40, 23, @on
	exec sp_trace_setevent @TraceID, 41, 1, @on
	exec sp_trace_setevent @TraceID, 41, 3, @on
	exec sp_trace_setevent @TraceID, 41, 6, @on
	exec sp_trace_setevent @TraceID, 41, 9, @on
	exec sp_trace_setevent @TraceID, 41, 10, @on
	exec sp_trace_setevent @TraceID, 41, 11, @on
	exec sp_trace_setevent @TraceID, 41, 12, @on
	exec sp_trace_setevent @TraceID, 41, 13, @on
	exec sp_trace_setevent @TraceID, 41, 14, @on
	exec sp_trace_setevent @TraceID, 41, 15, @on
	exec sp_trace_setevent @TraceID, 41, 16, @on
	exec sp_trace_setevent @TraceID, 41, 17, @on
	exec sp_trace_setevent @TraceID, 41, 18, @on
	exec sp_trace_setevent @TraceID, 41, 23, @on
	exec sp_trace_setevent @TraceID, 42, 1, @on
	exec sp_trace_setevent @TraceID, 42, 3, @on
	exec sp_trace_setevent @TraceID, 42, 6, @on
	exec sp_trace_setevent @TraceID, 42, 9, @on
	exec sp_trace_setevent @TraceID, 42, 10, @on
	exec sp_trace_setevent @TraceID, 42, 11, @on
	exec sp_trace_setevent @TraceID, 42, 12, @on
	exec sp_trace_setevent @TraceID, 42, 13, @on
	exec sp_trace_setevent @TraceID, 42, 14, @on
	exec sp_trace_setevent @TraceID, 42, 15, @on
	exec sp_trace_setevent @TraceID, 42, 16, @on
	exec sp_trace_setevent @TraceID, 42, 17, @on
	exec sp_trace_setevent @TraceID, 42, 18, @on
	exec sp_trace_setevent @TraceID, 42, 23, @on
	exec sp_trace_setevent @TraceID, 43, 1, @on
	exec sp_trace_setevent @TraceID, 43, 3, @on
	exec sp_trace_setevent @TraceID, 43, 6, @on
	exec sp_trace_setevent @TraceID, 43, 9, @on
	exec sp_trace_setevent @TraceID, 43, 10, @on
	exec sp_trace_setevent @TraceID, 43, 11, @on
	exec sp_trace_setevent @TraceID, 43, 12, @on
	exec sp_trace_setevent @TraceID, 43, 13, @on
	exec sp_trace_setevent @TraceID, 43, 14, @on
	exec sp_trace_setevent @TraceID, 43, 15, @on
	exec sp_trace_setevent @TraceID, 43, 16, @on
	exec sp_trace_setevent @TraceID, 43, 17, @on
	exec sp_trace_setevent @TraceID, 43, 18, @on
	exec sp_trace_setevent @TraceID, 43, 23, @on
	exec sp_trace_setevent @TraceID, 44, 1, @on
	exec sp_trace_setevent @TraceID, 44, 3, @on
	exec sp_trace_setevent @TraceID, 44, 6, @on
	exec sp_trace_setevent @TraceID, 44, 9, @on
	exec sp_trace_setevent @TraceID, 44, 10, @on
	exec sp_trace_setevent @TraceID, 44, 11, @on

	exec sp_trace_setevent @TraceID, 44, 12, @on
	exec sp_trace_setevent @TraceID, 44, 13, @on
	exec sp_trace_setevent @TraceID, 44, 14, @on
	exec sp_trace_setevent @TraceID, 44, 15, @on
	exec sp_trace_setevent @TraceID, 44, 16, @on
	exec sp_trace_setevent @TraceID, 44, 17, @on
	exec sp_trace_setevent @TraceID, 44, 18, @on
	exec sp_trace_setevent @TraceID, 44, 23, @on
	exec sp_trace_setevent @TraceID, 45, 1, @on
	exec sp_trace_setevent @TraceID, 45, 3, @on
	exec sp_trace_setevent @TraceID, 45, 6, @on
	exec sp_trace_setevent @TraceID, 45, 9, @on
	exec sp_trace_setevent @TraceID, 45, 10, @on
	exec sp_trace_setevent @TraceID, 45, 11, @on
	exec sp_trace_setevent @TraceID, 45, 12, @on
	exec sp_trace_setevent @TraceID, 45, 13, @on
	exec sp_trace_setevent @TraceID, 45, 14, @on
	exec sp_trace_setevent @TraceID, 45, 15, @on
	exec sp_trace_setevent @TraceID, 45, 16, @on
	exec sp_trace_setevent @TraceID, 45, 17, @on
	exec sp_trace_setevent @TraceID, 45, 18, @on
	exec sp_trace_setevent @TraceID, 45, 23, @on
	exec sp_trace_setevent @TraceID, 50, 1, @on
	exec sp_trace_setevent @TraceID, 50, 3, @on
	exec sp_trace_setevent @TraceID, 50, 6, @on
	exec sp_trace_setevent @TraceID, 50, 9, @on
	exec sp_trace_setevent @TraceID, 50, 10, @on
	exec sp_trace_setevent @TraceID, 50, 11, @on
	exec sp_trace_setevent @TraceID, 50, 12, @on
	exec sp_trace_setevent @TraceID, 50, 13, @on
	exec sp_trace_setevent @TraceID, 50, 14, @on
	exec sp_trace_setevent @TraceID, 50, 15, @on
	exec sp_trace_setevent @TraceID, 50, 16, @on
	exec sp_trace_setevent @TraceID, 50, 17, @on
	exec sp_trace_setevent @TraceID, 50, 18, @on
	exec sp_trace_setevent @TraceID, 50, 23, @on
	exec sp_trace_setevent @TraceID, 51, 1, @on
	exec sp_trace_setevent @TraceID, 51, 3, @on
	exec sp_trace_setevent @TraceID, 51, 6, @on
	exec sp_trace_setevent @TraceID, 51, 9, @on
	exec sp_trace_setevent @TraceID, 51, 10, @on
	exec sp_trace_setevent @TraceID, 51, 11, @on
	exec sp_trace_setevent @TraceID, 51, 12, @on
	exec sp_trace_setevent @TraceID, 51, 13, @on
	exec sp_trace_setevent @TraceID, 51, 14, @on
	exec sp_trace_setevent @TraceID, 51, 15, @on
	exec sp_trace_setevent @TraceID, 51, 16, @on
	exec sp_trace_setevent @TraceID, 51, 17, @on
	exec sp_trace_setevent @TraceID, 51, 18, @on
	exec sp_trace_setevent @TraceID, 51, 23, @on
	exec sp_trace_setevent @TraceID, 52, 1, @on
	exec sp_trace_setevent @TraceID, 52, 3, @on
	exec sp_trace_setevent @TraceID, 52, 6, @on
	exec sp_trace_setevent @TraceID, 52, 9, @on
	exec sp_trace_setevent @TraceID, 52, 10, @on
	exec sp_trace_setevent @TraceID, 52, 11, @on
	exec sp_trace_setevent @TraceID, 52, 12, @on
	exec sp_trace_setevent @TraceID, 52, 13, @on
	exec sp_trace_setevent @TraceID, 52, 14, @on
	exec sp_trace_setevent @TraceID, 52, 15, @on
	exec sp_trace_setevent @TraceID, 52, 16, @on
	exec sp_trace_setevent @TraceID, 52, 17, @on
	exec sp_trace_setevent @TraceID, 52, 18, @on
	exec sp_trace_setevent @TraceID, 52, 23, @on
	exec sp_trace_setevent @TraceID, 53, 1, @on
	exec sp_trace_setevent @TraceID, 53, 3, @on
	exec sp_trace_setevent @TraceID, 53, 6, @on
	exec sp_trace_setevent @TraceID, 53, 9, @on
	exec sp_trace_setevent @TraceID, 53, 10, @on
	exec sp_trace_setevent @TraceID, 53, 11, @on
	exec sp_trace_setevent @TraceID, 53, 12, @on
	exec sp_trace_setevent @TraceID, 53, 13, @on
	exec sp_trace_setevent @TraceID, 53, 14, @on
	exec sp_trace_setevent @TraceID, 53, 15, @on
	exec sp_trace_setevent @TraceID, 53, 16, @on
	exec sp_trace_setevent @TraceID, 53, 17, @on
	exec sp_trace_setevent @TraceID, 53, 18, @on
	exec sp_trace_setevent @TraceID, 53, 23, @on
	exec sp_trace_setevent @TraceID, 59, 1, @on
	exec sp_trace_setevent @TraceID, 59, 3, @on
	exec sp_trace_setevent @TraceID, 59, 6, @on
	exec sp_trace_setevent @TraceID, 59, 9, @on
	exec sp_trace_setevent @TraceID, 59, 10, @on
	exec sp_trace_setevent @TraceID, 59, 11, @on
	exec sp_trace_setevent @TraceID, 59, 12, @on
	exec sp_trace_setevent @TraceID, 59, 13, @on
	exec sp_trace_setevent @TraceID, 59, 14, @on
	exec sp_trace_setevent @TraceID, 59, 15, @on
	exec sp_trace_setevent @TraceID, 59, 16, @on
	exec sp_trace_setevent @TraceID, 59, 17, @on
	exec sp_trace_setevent @TraceID, 59, 18, @on
	exec sp_trace_setevent @TraceID, 59, 23, @on
	exec sp_trace_setevent @TraceID, 71, 1, @on
	exec sp_trace_setevent @TraceID, 71, 3, @on
	exec sp_trace_setevent @TraceID, 71, 6, @on
	exec sp_trace_setevent @TraceID, 71, 9, @on
	exec sp_trace_setevent @TraceID, 71, 10, @on
	exec sp_trace_setevent @TraceID, 71, 11, @on
	exec sp_trace_setevent @TraceID, 71, 12, @on
	exec sp_trace_setevent @TraceID, 71, 13, @on
	exec sp_trace_setevent @TraceID, 71, 14, @on
	exec sp_trace_setevent @TraceID, 71, 15, @on
	exec sp_trace_setevent @TraceID, 71, 16, @on
	exec sp_trace_setevent @TraceID, 71, 17, @on
	exec sp_trace_setevent @TraceID, 71, 18, @on
	exec sp_trace_setevent @TraceID, 71, 23, @on
	exec sp_trace_setevent @TraceID, 72, 1, @on
	exec sp_trace_setevent @TraceID, 72, 3, @on
	exec sp_trace_setevent @TraceID, 72, 6, @on
	exec sp_trace_setevent @TraceID, 72, 9, @on
	exec sp_trace_setevent @TraceID, 72, 10, @on
	exec sp_trace_setevent @TraceID, 72, 11, @on
	exec sp_trace_setevent @TraceID, 72, 12, @on
	exec sp_trace_setevent @TraceID, 72, 13, @on
	exec sp_trace_setevent @TraceID, 72, 14, @on
	exec sp_trace_setevent @TraceID, 72, 15, @on
	exec sp_trace_setevent @TraceID, 72, 16, @on
	exec sp_trace_setevent @TraceID, 72, 17, @on
	exec sp_trace_setevent @TraceID, 72, 18, @on
	exec sp_trace_setevent @TraceID, 72, 23, @on
	exec sp_trace_setevent @TraceID, 73, 1, @on
	exec sp_trace_setevent @TraceID, 73, 3, @on
	exec sp_trace_setevent @TraceID, 73, 6, @on
	exec sp_trace_setevent @TraceID, 73, 9, @on
	exec sp_trace_setevent @TraceID, 73, 10, @on
	exec sp_trace_setevent @TraceID, 73, 11, @on
	exec sp_trace_setevent @TraceID, 73, 12, @on
	exec sp_trace_setevent @TraceID, 73, 13, @on
	exec sp_trace_setevent @TraceID, 73, 14, @on
	exec sp_trace_setevent @TraceID, 73, 15, @on
	exec sp_trace_setevent @TraceID, 73, 16, @on
	exec sp_trace_setevent @TraceID, 73, 17, @on
	exec sp_trace_setevent @TraceID, 73, 18, @on
	exec sp_trace_setevent @TraceID, 73, 23, @on
	exec sp_trace_setevent @TraceID, 74, 1, @on
	exec sp_trace_setevent @TraceID, 74, 3, @on
	exec sp_trace_setevent @TraceID, 74, 6, @on
	exec sp_trace_setevent @TraceID, 74, 9, @on
	exec sp_trace_setevent @TraceID, 74, 10, @on
	exec sp_trace_setevent @TraceID, 74, 11, @on
	exec sp_trace_setevent @TraceID, 74, 12, @on
	exec sp_trace_setevent @TraceID, 74, 13, @on
	exec sp_trace_setevent @TraceID, 74, 14, @on
	exec sp_trace_setevent @TraceID, 74, 15, @on
	exec sp_trace_setevent @TraceID, 74, 16, @on
	exec sp_trace_setevent @TraceID, 74, 17, @on
	exec sp_trace_setevent @TraceID, 74, 18, @on
	exec sp_trace_setevent @TraceID, 74, 23, @on
	exec sp_trace_setevent @TraceID, 78, 1, @on
	exec sp_trace_setevent @TraceID, 78, 3, @on
	exec sp_trace_setevent @TraceID, 78, 6, @on
	exec sp_trace_setevent @TraceID, 78, 9, @on
	exec sp_trace_setevent @TraceID, 78, 10, @on
	exec sp_trace_setevent @TraceID, 78, 11, @on
	exec sp_trace_setevent @TraceID, 78, 12, @on
	exec sp_trace_setevent @TraceID, 78, 13, @on
	exec sp_trace_setevent @TraceID, 78, 14, @on
	exec sp_trace_setevent @TraceID, 78, 15, @on
	exec sp_trace_setevent @TraceID, 78, 16, @on
	exec sp_trace_setevent @TraceID, 78, 17, @on
	exec sp_trace_setevent @TraceID, 78, 18, @on
	exec sp_trace_setevent @TraceID, 78, 23, @on
	exec sp_trace_setevent @TraceID, 81, 1, @on
	exec sp_trace_setevent @TraceID, 81, 3, @on
	exec sp_trace_setevent @TraceID, 81, 6, @on
	exec sp_trace_setevent @TraceID, 81, 9, @on
	exec sp_trace_setevent @TraceID, 81, 10, @on
	exec sp_trace_setevent @TraceID, 81, 11, @on
	exec sp_trace_setevent @TraceID, 81, 12, @on
	exec sp_trace_setevent @TraceID, 81, 13, @on
	exec sp_trace_setevent @TraceID, 81, 14, @on
	exec sp_trace_setevent @TraceID, 81, 15, @on
	exec sp_trace_setevent @TraceID, 81, 16, @on
	exec sp_trace_setevent @TraceID, 81, 17, @on
	exec sp_trace_setevent @TraceID, 81, 18, @on
	exec sp_trace_setevent @TraceID, 81, 23, @on
	exec sp_trace_setevent @TraceID, 97, 1, @on
	exec sp_trace_setevent @TraceID, 97, 3, @on
	exec sp_trace_setevent @TraceID, 97, 6, @on
	exec sp_trace_setevent @TraceID, 97, 9, @on
	exec sp_trace_setevent @TraceID, 97, 10, @on
	exec sp_trace_setevent @TraceID, 97, 11, @on
	exec sp_trace_setevent @TraceID, 97, 12, @on
	exec sp_trace_setevent @TraceID, 97, 13, @on
	exec sp_trace_setevent @TraceID, 97, 14, @on
	exec sp_trace_setevent @TraceID, 97, 15, @on
	exec sp_trace_setevent @TraceID, 97, 16, @on
	exec sp_trace_setevent @TraceID, 97, 17, @on
	exec sp_trace_setevent @TraceID, 97, 18, @on
	exec sp_trace_setevent @TraceID, 97, 23, @on


	-- Set the Filters
	declare @intfilter int
	declare @bigintfilter bigint
	if @v_db_name != ''
		exec sp_trace_setfilter @TraceID, 3, 1, 0, @v_dbid

	exec sp_trace_setfilter @TraceID, 10, 0, 7, N'SQL Profiler'
	exec sp_trace_setfilter @TraceID, 13, 0, 4, @v_duration


	-- Set the trace status to start
	exec sp_trace_setstatus @TraceID, 1

	-- display trace id for future references
	select TraceID=@TraceID
goto finish

error: 
select ErrorCode=@rc

finish:


GO
/****** Object:  Table [dbo].[tbl_dba_Block_Interval_Config]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_Block_Interval_Config](
	[BlockInterval] [int] NOT NULL CONSTRAINT [DF_tbl_Block_Interval_Config_BlockInterval]  DEFAULT ((120))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_BackupPlan_History]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_BackupPlan_History](
	[xdatabase] [sysname] NOT NULL,
	[xFileGroup] [sysname] NULL,
	[xDaily] [char](1) NULL,
	[xWeekly] [varchar](7) NULL,
	[xWDayName] [varchar](100) NULL,
	[xMonthly] [char](1) NULL,
	[xWOfMonth] [char](1) NULL,
	[xMDayName] [varchar](20) NULL,
	[xSequence] [int] NULL,
	[xBkupType] [char](4) NULL,
	[xAlterDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_CHECKDB_Output]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_CHECKDB_Output](
	[OutputText] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_AlterIndex_Output]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_AlterIndex_Output](
	[OutputText] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_starting_batch_alert_get]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Description	: 	Calculate number of previous batch to include in the block group
Created on	:	
Modified on	:	10/14/2006
Dependencies:
				Table							Procedure
				tbl_block_tracker_batch			*************
				tbl_block_tracker						


----------------------------------------------------------------------------------------------------------------------------*/

CREATE PROCEDURE [dbo].[usp_dba_starting_batch_alert_get]
(
  	@spid_int INT, 
	@blocking_time_interval_int int,
	@batch_int int OUTPUT
) with encryption
AS
DECLARE @Error_int int, @Block_Group_int int, @last_alerted_batch_int int
	DECLARE @batch_count_int int

	-- CALCULATE NUMBER OF PREVIOUS BATCH TO INCLUDE IN THE Block_Group
	SELECT @batch_count_int = @blocking_time_interval_int/60

	-- LAST ALERTED BATCH
	SELECT @last_alerted_batch_int = MAX(Batch_ID) FROM tbl_block_tracker_batch WHERE alerted = 1

	SELECT @batch_int = t1.Batch_ID, @Block_Group_int = Block_Group
	FROM tbl_block_tracker_batch t1
	   INNER JOIN tbl_block_tracker t2 ON (t1.Batch_ID = t2.Batch_ID)
	WHERE t1.Batch_ID = @last_alerted_batch_int
	   AND t2.spid = @spid_int

	SELECT @batch_int = @batch_int - @batch_count_int

	--  ASSIGN Block_Group IF IT EXISTS IN PREVIOUS BATCH AND spid IS THE SAME AS CURRENT BATCH
	SELECT @Block_Group_int = Block_Group 
	FROM tbl_block_tracker_batch t1 
	   INNER JOIN tbl_block_tracker t2 ON (t1.Batch_ID = t2.Batch_ID)
	WHERE t1.Batch_ID = @last_alerted_batch_int - 1 AND t2.spid = @spid_int

	IF @Block_Group_int IS NOT NULL
	   SELECT @batch_int = @Block_Group_int

	SELECT @Error_int = @@ERROR

	IF @Error_int <> 0
	   RETURN @Error_int

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_kill_process]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
	Purpose		: Kill User process per database, user, activity
	Date        : 02/27/2007
	Usage	    :	usp_kill_process 'active'
					usp_kill_process 'non-active'
					usp_kill_process 'DBA'
  
******************************************************************************/

CREATE PROCEDURE [dbo].[usp_dba_kill_process]
(
	@process varchar(40) = null
) with encryption
AS
	DECLARE @spid INT,	@sql varchar(500)

	IF @process IS NULL
	BEGIN
		PRINT 'Usage: usp_kill_process <database_name:active:user_name:all>'
		RETURN 0
	END

	-- Kill all active User cursor --
	IF @process = 'active'
	BEGIN
		DECLARE spid_cursor CURSOR
			READ_ONLY FOR
				select spid
				from  master.dbo.sysprocesses
				where spid >= 0 and spid <= 32767 AND
				upper(cmd) <> 'AWAITING COMMAND'
				and spid != @@spid
				and spid > 6
	END
	ELSE

	-- Kill all non-active User cursor --
	IF @process = 'non-active'
	BEGIN
		DECLARE spid_cursor CURSOR
			READ_ONLY FOR
				select spid
					from  master.dbo.sysprocesses
					where spid >= 0 and spid <= 32767 AND
					upper(cmd) = 'AWAITING COMMAND'
					and spid != @@spid
					and spid > 6
	END
	ELSE


	-- Kill all Users cursor --
	IF @process = 'ALL'
	BEGIN
		DECLARE spid_cursor CURSOR
			READ_ONLY FOR
				select spid
					from  master.dbo.sysprocesses
					where spid >= 0
					and spid <= 32767
					and spid != @@spid
					and spid > 6
	END
	ELSE

	-- Kill all User in database cursor --
	IF db_id(@process) is not null
	BEGIN
		DECLARE spid_cursor CURSOR
			READ_ONLY FOR
				SELECT spid
					FROM master..sysprocesses
					WHERE DB_NAME(dbid) = @process
					AND spid != @@spid
					AND spid > 6
	END
	ELSE

	-- Kill all User name --
	IF suser_sid(@process) is not null
	BEGIN
		DECLARE spid_cursor CURSOR
			READ_ONLY FOR
				SELECT spid
					FROM master..sysprocesses
					WHERE sid = suser_sid(@process)
					AND spid != @@spid
					AND spid > 6
	END

	OPEN spid_cursor

	FETCH NEXT FROM spid_cursor INTO @spid

	WHILE (@@fetch_status <> -1)
	BEGIN
		IF (@@fetch_status <> -2)
		BEGIN
			set @sql='use master kill ' + cast(@spid as varchar(10))
			select @sql
			exec (@sql)
		END
		FETCH NEXT FROM spid_cursor INTO @spid
	END

	CLOSE spid_cursor
	DEALLOCATE spid_cursor


GO
/****** Object:  Table [dbo].[tbl_dba_window_Logins]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_window_Logins](
	[SQLQuery] [nvarchar](1000) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_Logins_defaultDB]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_Logins_defaultDB](
	[SQLQuery] [nvarchar](500) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_SQL_Logins_05]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_SQL_Logins_05](
	[Query_Part1] [varchar](100) NOT NULL,
	[Query_Part2] [varbinary](64) NULL,
	[Query_Part3] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_REINDEX_Output]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_REINDEX_Output](
	[OutputText] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_SQL_Logins]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_SQL_Logins](
	[Query_Part1] [varchar](100) NOT NULL,
	[Query_Part2] [varbinary](64) NULL,
	[Query_Part3] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_DriveSpace_Config]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_DriveSpace_Config](
	[DriveName] [char](1) NOT NULL,
	[Threshold] [int] NOT NULL CONSTRAINT [DF_tbl_dba_DriveSpace_Config_Threshold]  DEFAULT ((85))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_maintenance_config]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_maintenance_config](
	[xdatabase] [sysname] NOT NULL,
	[xfull] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_xfull]  DEFAULT ('Y'),
	[xsequence] [int] NOT NULL CONSTRAINT [DEFAULT_tbl_dba_maintenance_xsequence]  DEFAULT ((1)),
	[xdiff] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_xdiff]  DEFAULT ('N'),
	[xlog] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_xlog]  DEFAULT ('N'),
	[xcheckdb] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_xcheckdb]  DEFAULT ('Y'),
	[xreindex] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_xreindex]  DEFAULT ('Y'),
	[xupdatestats] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_xupdatestats]  DEFAULT ('Y'),
	[withsamplepercent] [varchar](25) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_withsamplepercent]  DEFAULT ('with sample 50 percent'),
	[xupdateusage] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_xupdateusage]  DEFAULT ('Y'),
	[create_dt] [datetime] NOT NULL,
	[drop_dt] [datetime] NULL,
	[xretention] [char](2) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xretention]  DEFAULT ('1'),
	[xReindexLimit] [int] NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xReindexLimit]  DEFAULT ((50)),
	[xLogSpaceLimit] [int] NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xLogSpaceLimit]  DEFAULT ((70)),
	[xskip] [bit] NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_xskip]  DEFAULT ((0)),
	[xskipManual] [bit] NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_xskipManual]  DEFAULT ((0)),
	[xRaiseTicket] [bit] NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xRaiseTicket]  DEFAULT ((0)),
	[xFileGroup] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xFileGroup]  DEFAULT ('N'),
	[xMultiBkupPlan] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xMultiBkupPlan]  DEFAULT ('N'),
	[xAlterIndex] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xAlterIndex]  DEFAULT ('Y'),
	[xFragLimit] [int] NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xFragLimit]  DEFAULT ((10)),
	[xFragRebuild] [int] NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xFragRebuild]  DEFAULT ((30)),
	[xVerify] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xVerify]  DEFAULT ('N'),
	[xGSMSetting] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_config_xGSMSetting]  DEFAULT ('N'),
 CONSTRAINT [xpk_tbl_dba_maintenance_xdatabase] PRIMARY KEY CLUSTERED 
(
	[xdatabase] ASC
) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_Ticket_Content]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_Ticket_Content](
	[TextLine1] [varchar](500) NULL,
	[TextLine2] [varchar](500) NULL,
	[TextLine3] [varchar](500) NULL,
	[TextLine4] [varchar](500) NULL,
	[TextLine5] [varchar](150) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_Alert_Config]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_Alert_Config](
	[nID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[EmailTo] [varchar](2000) NOT NULL,
	[EmailCC] [varchar](2000) NULL,
	[EmailBCC] [varchar](1000) NULL,
	[AlertType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_dba_AlertConfig] PRIMARY KEY CLUSTERED 
(
	[nID] ASC
) ON [PRIMARY],
 CONSTRAINT [IX_tbl_dba_Alert_Config] UNIQUE NONCLUSTERED 
(
	[AlertType] ASC
) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_SMTPServer_Config]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_SMTPServer_Config](
	[SMTPServer] [varchar](1000) NOT NULL,
	[MailFrom] [varchar](1000) NOT NULL,
	[AdditionalInfo_Sub] [varchar](50) NULL,
	[AdditionalInfo_Body] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_resync_users]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/*******************************************************************************************

Purpose		: Resynchroning Users
Created on	: 12 October 2006
Modified on : 12 October 2006
Version		: 1.1
Usage		: 
				DBA..usp_dba_resync_users 'DBA'

*******************************************************************************************/



CREATE Procedure [dbo].[usp_dba_resync_users]
(
	@dbName varchar(30) = NULL
) with encryption
as
set nocount on
declare @sql varchar(5000)
--use master
if @dbName = NULL 
begin
	DECLARE curDB CURSOR FOR
	select name from master..sysdatabases
end
else
begin
	DECLARE curDB CURSOR FOR
	select name from master..sysdatabases where name = @dbName
end
OPEN curDB
FETCH NEXT FROM curDB into @dbName
WHILE @@FETCH_STATUS = 0
BEGIN
select "start sync. db: " + @dbName
set @sql = "declare @UserName varchar(50) use [" + @dbName + "]  " +
	"DECLARE curLogin CURSOR FOR
	select su.name
	from sysusers  su
	join master..syslogins sl
 	  on su.name = sl.name
	where uid > 3 and su.status = 2
	OPEN curLogin
	FETCH NEXT FROM curLogin into @UserName
	WHILE @@FETCH_STATUS = 0
	BEGIN
	EXEC sp_change_users_login 'Update_One', @UserName, @UserName
	FETCH NEXT FROM curLogin into @UserName
	END
	CLOSE curLogin
	DEALLOCATE curLogin"
exec ( @sql )
FETCH NEXT FROM curDB into @dbName
END
CLOSE curDB
DEALLOCATE curDB






GO
/****** Object:  Table [dbo].[tbl_dba_full_backup_archive]    Script Date: 09/20/2007 18:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_full_backup_archive](
	[xdatabase] [sysname] NOT NULL,
	[starttime] [smalldatetime] NULL,
	[endtime] [smalldatetime] NULL,
	[succeeded] [smallint] NULL,
	[directory] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dba_full_backup_completed]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_full_backup_completed](
	[xdatabase] [sysname] NOT NULL,
	[starttime] [smalldatetime] NULL,
	[endtime] [smalldatetime] NULL,
	[succeeded] [smallint] NULL,
	[directory] [varchar](100) NULL,
	[Failed] [char](1) NOT NULL CONSTRAINT [DF_tbl_dba_full_backup_completed_Failed]  DEFAULT ('N')
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_block_alert]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Description	: 	This stored procedure will send out alert email if there is a blocking which lasted more than specified duration)
Created on	:	
Modified on	:	10/14/2006
Version		:	1.1
Dependencies:
				Table							Procedure
				tbl_dba_block_tracker_batch		usp_dba_starting_batch_alert_get
				tbl_dba_block_tracker			usp_Send_Mail
----------------------------------------------------------------------------------------------------------------------------*/

CREATE PROCEDURE [dbo].[usp_dba_block_alert] 
(
					@blocking_time_interval_int int-- time interval in second
) with encryption
AS
SET NOCOUNT ON

	DECLARE @blocking_spid_int int,
		@blocking_time datetime,
		@prev_blocking_time datetime,
		@Batch_ID_int int,
		@exec_stmt varchar(1000),
		@prev_alerted_Batch_ID int

	-- get the current batch number
	SELECT @Batch_ID_int = max(Batch_ID) FROM tbl_dba_block_tracker_batch

	DECLARE spid_cursor CURSOR FOR 
	SELECT t1.Batch_ID, t2.spid, t1.Batch_Time 
	FROM tbl_dba_block_tracker_batch t1
	   INNER JOIN tbl_dba_block_tracker t2 ON t1.Batch_ID = t2.Batch_ID 
	WHERE t1.Batch_ID = @Batch_ID_int 

	OPEN spid_cursor
	FETCH NEXT FROM spid_cursor INTO @Batch_ID_int, @blocking_spid_int, @blocking_time
	WHILE @@FETCH_STATUS = 0
	   BEGIN

		  SELECT @prev_blocking_time = DATEADD (ss, -@blocking_time_interval_int, @blocking_time)

		  --  Compare previous and current blocking info
		  --  if the blocking spid is the same and blocking time is more than specified blocking duration
		  --  Alert email will be sent
	 
		  IF EXISTS (SELECT * FROM tbl_dba_block_tracker_batch t1
         			INNER JOIN tbl_dba_block_tracker t2 ON t1.Batch_ID = t2.Batch_ID
      			 WHERE t2.spid = @blocking_spid_int AND
	 			t1.Batch_Time BETWEEN DATEADD(ss, -5, @prev_blocking_time) AND DATEADD(ss, 5, @prev_blocking_time))
		  BEGIN
		 	 
			 SELECT @exec_stmt = 'usp_dba_SendMail @subject = ''' + @@servername + ' Blocking ALERT ''' +
			', @Body = ''spid ' + RTRIM(CONVERT(char,@blocking_spid_int) ) + ' is blocking other spid(s) more than ' +
			 convert(varchar, @blocking_time_interval_int) + ' seconds'' '
		 EXEC (@exec_stmt)


		 -- LOG THAT EMAIL ALERT SENT 
		 UPDATE tbl_dba_block_tracker_batch SET
  			Alerted = 1
			 WHERE Batch_ID = @Batch_ID_int

		 -- GET STARTING BATCH ALERT
		 EXEC usp_dba_starting_batch_alert_get 
			@spid_int = @blocking_spid_int , 
			@blocking_time_interval_int = @blocking_time_interval_int,
			@batch_int = @prev_alerted_Batch_ID OUTPUT       
		 
		 PRINT 'PREVIOUSLY ALERTED'
		 SELECT @prev_alerted_Batch_ID


		 -- RECORD BLOCKING GROUP
			 UPDATE tbl_dba_block_tracker_batch SET
			   Block_Group = @prev_alerted_Batch_ID
    		 WHERE (Batch_ID  BETWEEN  @Batch_ID_int - (@blocking_time_interval_int/60) AND @Batch_ID_int )
			AND Block_Group IS NULL
		  END

		  FETCH NEXT FROM spid_cursor INTO @Batch_ID_int, @blocking_spid_int, @blocking_time
	   END

	CLOSE spid_cursor
	DEALLOCATE spid_cursor




GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_Initiate_FGBackup]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: 	Call FileGroup backup procedure based on configuration
Created on	:	2/9/2007
Modified on	: 	2/9/2007
Version		:	1.1
dependencies	: Table					Procedure
		  tbl_dba_maintenance_config			usp_tbl_dba_maintenance_u
		  tbl_dba_FileGroup
Usage: 

exec DBA..usp_tbl_dba_Initiate_FGBackup		
--------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE procedure [dbo].[usp_tbl_dba_Initiate_FGBackup] with encryption
as

	declare @database	varchar(100),
		@FileGroup 	varchar(100), 
		@Sequence	int,
		@NumWeek	int
	-- update current status for every database
	exec usp_tbl_dba_maintenance_u

	-- Process Daily Schedule
	print 'Starting Daily Backup process.......'


	declare curFG cursor for select xdatabase, xFileGroup, xSequence
				 from DBA..tbl_dba_FileGroup
				 where xDaily = 'Y'
				 order by xdatabase
	

	open curFG
	fetch curFG into @database, @FileGroup, @Sequence

	while @@fetch_status = 0
	begin

		exec usp_tbl_dba_FileGroup_backup @database = @database, @FileGroup = @FileGroup, @sequence = @Sequence, @execute='Y'	

		fetch curFG into @database, @FileGroup, @Sequence

	end
	close curFG
	deallocate curFG
	print 'Daily backup process completed.....'
	-- Daily Schedule processing over
	-- Process Weekly Schedule
	print 'Starting Weekly backup process......'

	select @NumWeek  = (datepart(ww,getdate())) + 1 - datepart(ww,dateadd(dd,-datepart(dd,getdate()),getdate()))
	
	declare curFG cursor for select xdatabase, xFileGroup, xSequence
				 from DBA..tbl_dba_FileGroup
				 where xDaily = 'N' 
				 and charindex(convert(char(1),@NumWeek),xWeekly,1) > 0
				 and xWDayName = datename(dw,getdate())
				 order by xdatabase
	
	open curFG
	fetch curFG into @database, @FileGroup, @Sequence

	while @@fetch_status = 0
	begin

		exec usp_tbl_dba_FileGroup_backup @database = @database, @FileGroup = @FileGroup, @sequence = @Sequence, @execute='Y'	

		fetch curFG into @database, @FileGroup, @Sequence

	end
	close curFG
	deallocate curFG
	print 'Weekly backup process completed.....'
	-- Weekly Schedule processing over
	-- Process Monthly Schedule

	print 'Starting Monthly backup process......'

	declare curFG cursor for select xdatabase, xFileGroup, xSequence
				 from DBA..tbl_dba_FileGroup
				 where xDaily = 'N' 
				 and (charindex(convert(char(1),@NumWeek),xWeekly,1) = 0 or xWDayName <> xMDayName)
				 and xMonthly = 'Y' and xWOfMonth = @NumWeek
				 and xMDayName = datename(dw,getdate())
				 order by xdatabase
	
	open curFG
	fetch curFG into @database, @FileGroup, @Sequence

	while @@fetch_status = 0
	begin

		exec usp_tbl_dba_FileGroup_backup @database = @database, @FileGroup = @FileGroup, @sequence = @Sequence, @execute='Y'	

		fetch curFG into @database, @FileGroup, @Sequence

	end
	close curFG
	deallocate curFG

	print 'Monthly backup process completed.....'
	-- Monthly Schedule processing over

GO
/****** Object:  StoredProcedure [dbo].[usp_dba_TSMBackupDetail]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*******************************************************************************************

Purpose		: Generate TSM Backup Detail for Daily Report 
Created on	: 09/04/2007

dependencies:
				Table						Procedure/Function
				tbl_dba_full_backup_completed			ufn_dba_QueryFile
				tbl_dba_DriveSpace_Config
				tbl_dba_TSMReport_Config
*******************************************************************************************/

CREATE         procedure [dbo].[usp_dba_TSMBackupDetail] with encryption
as
	set nocount on
	
	declare @DriveName varchar(50), @fName varchar(250), @database sysname, 
		@vSearchPattern_s varchar(300), @vSearchPattern_s1 varchar(300), @vSearchPattern varchar(100),
		@iCtr int, @BackupType char(3), @LastEntryTime datetime,
		@vStatus varchar(20), @vFilePath varchar(500), @vLine varchar(7860),
		@vDate varchar(10), @vTime varchar(10), @DateTime datetime, @vLastFile varchar(500)

	create table #dsmFilePath
	(
		fName varchar(350)
	
	)
	create table #dsmCheckPath
	(
		vOutput varchar(250)
	
	)

	-- Pickup 1 database name possibly the one which was backed up at end
	
	select top 1 @database = xdatabase  from DBA..tbl_dba_full_backup_completed where succeeded=1 order by endtime desc

	-- look for dsmsched.log file on all available drive	
	declare cur cursor for select DriveName from DBA..tbl_dba_DriveSpace_Config
	
	open cur
	
	fetch cur into @DriveName
	
	while @@fetch_status = 0
	begin

		-- check and retrieve complete path of dsmsched.log file	
		insert into #dsmCheckPath exec('master..xp_cmdshell ''dir ' + @DriveName + ':\dsmsched.log /S /B''')
		
		-- filter only complete path for dsmsched.log file because prev out may have returned something else also
		insert into #dsmFilePath exec('select vOutput from #dsmCheckPath where vOutput like ''' + @DriveName + ':\%''')
			
		truncate table #dsmCheckPath
	
		fetch cur into @DriveName
	
	end 
	close cur
	deallocate cur

	drop table #dsmCheckPath

	 create table #tbl_BkupDetail
	(

		nSNo	numeric identity(1,1),
		vLine 	varchar(7860)

	)
	--select fName from #dsmFilePath
	-- prepare Search Pattern based on your requirement. this will passed to where clause	


	set @vSearchPattern_s = ''

	declare curSearch cursor for select BackupType from DBA..tbl_dba_TSMReport_Config where Display = 'Y' order by BackupType
	open curSearch
	fetch curSearch into @BackupType
	while @@fetch_status = 0
	begin

		set @vSearchPattern_s = @vSearchPattern_s + ' vLine like ''%\PSDBA\' + @@servername + '\%\%_%_%.' + @BackupType + '%''|' 

		fetch curSearch into @BackupType
		
	end
	close curSearch
	deallocate curSearch

	set @vSearchPattern_s1 = @vSearchPattern_s
	
	--**************************************************************	
	declare curFile cursor for select fName from #dsmFilePath
	
	open curFile
	
	fetch curFile into @fName

	while @@fetch_status = 0
	begin

		set @vSearchPattern_s = @vSearchPattern_s1		
		while len(@vSearchPattern_s) > 0
		begin
	
			set @vSearchPattern = left(@vSearchPattern_s,charindex('|',@vSearchPattern_s,1)-1)
			set @vSearchPattern_s = replace(@vSearchPattern_s, @vSearchPattern + '|','')

			insert into #tbl_BkupDetail (vLine) exec ('select vLine from DBA..ufn_dba_QueryFile (''' + @fName + ''')'
				+ ' where (' + @vSearchPattern + ')')


		end
					
		if exists(select top 1 1 from #tbl_BkupDetail)				
			break

		fetch curFile into @fName
	end
	
	close curFile
	deallocate curFile
	
	-- cut run date, run time, and file name for output

	truncate table #dsmFilePath
	
	declare curResult cursor for select vLine from #tbl_BkupDetail order by nSNo
	open curResult
	fetch curResult into @vLine
	
	select @LastEntryTime = max(BackupTime) from DBA..tbl_dba_TSMLog

	if @LastEntryTime is null
		set @LastEntryTime = '2007-09-01 00:00:00'



	while @@fetch_status = 0
	begin
		set @vLine = ltrim(rtrim(@vLine))

		set @vDate = left(@vLine,charindex(' ',@vLine,1))
		

		set @vDate = right(@vDate,4) + '-' + left(@vDate,2) + '-' + substring(@vDate,4,2)
	
		set @vTime = substring(@vLine, (len(@vDate) + 2), 8)
	
--		set @vLastFile = substring(@vLine, charindex((@database + '_'),@vLine,1), charindex('.',@vLine,charindex((@database+'_'),@vLine,1)))

		set @vLastFile 	= rtrim(ltrim(right(@vLine,len(@vLine) - (charindex('\\',@vLine,1)-1))))
--		set @vLastFile 	= ltrim(right(@vLastFile,len(@vLastFile) - charindex(' ',@vLastFile,1)))

		if @vLastFile like '%fail%'
			set @vStatus = 'Failed'
		else
			set @vStatus = 'Succeeded'

		set @vFilePath = left(@vLastFile,charindex('SQLBackup\PSDBA',@vLastFile,1)+14)

		set @DateTime = @vDate + ' ' + @vTime

		if @vLastFile like '%.bak%'
			set @BackupType = 'bak'
		else if @vLastFile like '%.dif%'
			set @BackupType = 'dif'
		else
			set @BackupType = 'trn'

		if @DateTime>@LastEntryTime	
			insert into tbl_dba_TSMLog(BackupTime,FilePath,FName,BackupType,Status,EntryDate) values(@DateTime,@vFilePath,@vLastFile,@BackupType,@vStatus,replace(convert(varchar,getdate(),111),'/','-'))

		fetch curResult into @vLine
	end	

	close curResult
	deallocate curResult

	-- Return pipe (|) delimited Data for Report

		declare @BackupDate varchar(10), @StartTime datetime, 
			@EndTime datetime, @FilePath varchar(250), @Status varchar(20),
			@RunDuration varchar(15), @THrs varchar(2), @TMin varchar(2), @TSec varchar(2)
		
		set @iCtr = 0
		while @iCtr < 3
		begin
--			print 'hello'
			if @iCtr = 0
				set @BackupType = 'bak'
			else if @iCtr = 1
				set @BackupType = 'dif'
			else
				set @BackupType = 'trn'

			select 	@BackupDate	= convert(varchar,BackupTime,111),
				@StartTime	= min(BackupTime), 
				@EndTime	= max(BackupTime),
				@FilePath	= FilePath,
				@Status		= Status from DBA..tbl_dba_TSMLog
			where 	EntryDate	= convert(varchar,getdate(),111) and BackupType = @BackupType
			group by convert(varchar,BackupTime,111),FilePath,Status

			set @THrs = convert(varchar,datediff(hh, @StartTime, @EndTime))
			set @TMin = convert(varchar,datediff(mi, @StartTime, @EndTime))
			set @TSec = left(convert(varchar,datediff(s, @StartTime, @EndTime)),2)
			
			if @BackupDate is not NULL
			begin
			insert into #dsmFilePath 
					select	'MK|' + ltrim(rtrim(convert(varchar,@@servername))) + '|' + 
						@Status + '|' +  replace(@BackupDate,'/','-') + '|' + 
						convert(varchar,@StartTime,108) + '|' +
						replicate('0',2 -  len(@THrs)) + @THrs + ':' +
							replicate('0',2 -  len(@TMin)) + @TMin + ':' +
							replicate('0',2 -  len(@TSec)) + @TSec + '|' +
						@FilePath + '|' + @BackupType + '|MK'
			end
			set @BackupDate = NULL
			set @iCtr = @iCtr + 1
		end
	--***************************************************************

	if exists(select 1 from #dsmFilePath)
		select * from #dsmFilePath
	else
		select	'MK|' + ltrim(rtrim(convert(varchar,@@servername))) + '|****|***|**|*|No Record in Log|bak|MK'

	drop table #tbl_BkupDetail
	drop table #dsmFilePath


GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_delete_backup]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: Delete  database backup files based on retention period and backup options specfied in "tbl_dba_maintenance_config"
Created on	:	10/25/2006
Modified on	: 	12/12/2006
Version		:	1.2
dependencies	: Table					
		  tbl_dba_maintenance_config			
		  tbl_dba_maint_file_location
		  
Usage: 

exec DBA..usp_tbl_dba_delete_backup
				@database = 'DBA,master',
				@bkupType = 'Full'
				 ,@execute = 'Y'


[usp_tbl_dba_delete_backup] @execute='Y'

Modifications: 
	Version		:	1.2
	Daniel Olivares, July 29
	Fixed a bug where the process could not delete differential database backup files
			
--------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE procedure [dbo].[usp_tbl_dba_delete_backup] 
(
	@database varchar(500) = NULL,
	@bkupType varchar(10) = N'FULL', -- It can be either Full or Diff
	@execute char(1) = N'N'
) with encryption
as
begin
set nocount on

declare 	@delsql varchar(1000),
        	@delFileName varchar(1000),
			@retention int, @ret int,
			@xdatabase sysname,
			@fullbkupdir varchar(100),
			@diffbkupdir varchar(100),
			@logbkupdir  varchar(100),
			@xdiff char(1),
			@xlog char(1)
					
			
	set		@bkupType =  upper(@bkupType)
	if @bkupType <> N'FULL' and @bkupType <> N'DIFF'
	begin
		raiserror(N'Either FULL or DIFF can only be assigned to @bkupType (Second Parameter) option',16,1)
		return
	end
	else
	begin
		select	@fullbkupdir = db_full_bkup_location, @diffbkupdir = db_diff_bkup_location,
				@logbkupdir = db_tran_bkup_location from DBA..tbl_dba_maint_file_location

		if right(@fullbkupdir,1) = N'\' 
				select @fullbkupdir = @fullbkupdir + @@servername
		else 
				select @fullbkupdir = @fullbkupdir + N'\' + @@servername

		if right(@diffbkupdir,1) = N'\' 
				select @diffbkupdir = @diffbkupdir + @@servername
		else 
				select @diffbkupdir = @diffbkupdir + N'\' + @@servername

		if right(@logbkupdir,1) = N'\' 
				select @logbkupdir = @logbkupdir + @@servername
		else 
				select @logbkupdir = @logbkupdir + N'\' + @@servername

		if @fullbkupdir is null or len(@fullbkupdir) < 1
		begin
			 raiserror(N'A valid backup location must be set in DBA..tbl_dba_maint_file_location',16,1)
			 return
		end

			--display message
		if @execute = N'N'
		begin 
			select N'set @execute = ''Y''' as N'**To Delete Backup files**'
			return
		end
		else
		begin

				create table #tblFileToBeDeleted
				(
					DelFileName		varchar(1000),
					DelFileDate		int

				)
				declare @delFileDate datetime, @delFileDtToCh char(8)
				
				if @database is not NULL
				begin
					set @database = N'''' + replace(@database,N',',N''',''') + N''''
					exec(N'declare curDelFile cursor for select replace(xdatabase,'' '',''''), convert(int,''-'' + convert(varchar,(xretention-1))),xdiff,xlog 
														from tbl_dba_maintenance_config		
														where xdatabase in (' + @database + N')')

				end
				else
				begin
					if @bkupType = N'FULL'
					begin
						declare curDelFile cursor for select replace(xdatabase,N' ',N''), convert(int,N'-' + convert(varchar,(xretention-1))),xdiff,xlog 
															from tbl_dba_maintenance_config		
															where xfull = N'Y' and xskipManual!=1
					end
					else
					begin
						declare curDelFile cursor for select replace(xdatabase,N' ',N''), convert(int,N'-' + convert(varchar,(xretention-1))),xdiff,xlog 
															from tbl_dba_maintenance_config		
															where xdiff = N'Y' and xskipManual!=1
					end				
				end					
				open curDelFile

				fetch curDelFile into @xdatabase, @retention,@xdiff, @xlog

				while @@fetch_status = 0
				begin

						truncate table #tblFileToBeDeleted
						if @bkupType = N'FULL'
						begin

							insert into #tblFileToBeDeleted (DelFileName) exec(N'master..xp_cmdshell ''dir ' + @fullbkupdir + N'\' + @xdatabase + N'\*.bak /S /B''')
							if @xdiff = N'Y'
								insert into #tblFileToBeDeleted (DelFileName) exec(N'master..xp_cmdshell ''dir ' + @diffbkupdir + N'\' + @xdatabase + N'\*.dif /S /B''')
						end
						if @bkupType = N'DIFF'
								insert into #tblFileToBeDeleted (DelFileName) exec(N'master..xp_cmdshell ''dir ' + @diffbkupdir + N'\' + @xdatabase + N'\*.dif /S /B''')

						if @xlog = N'Y' or @database is not NULL
							insert into #tblFileToBeDeleted (DelFileName) exec(N'master..xp_cmdshell ''dir ' + @logbkupdir + N'\' + @xdatabase + N'\*.trn /S /B''')
			
						delete #tblFileToBeDeleted 
						where	DelFileName is NULL or DelFileName not like N'%\%\%'

						--Modifications: 
						--	Version		:	1.2
						--	Daniel Olivares, July 29
						--	Fixed a bug where the process could not delete differential database backup files
						update #tblFileToBeDeleted
						set	  DelFileDate = substring(DelFileName,(charindex(N'_db_20',DelFileName,1)+4),8)
						--set	  DelFileDate = substring(DelFileName,(charindex(@database+'_db_20',DelFileName,1)+len(@database)+4),8)
						where DelFileName like N'%.bak' or DelFileName like N'%.dif'

						update #tblFileToBeDeleted
						set   DelFileDate = substring(DelFileName,charindex(N'_tlog_',DelFileName,1)+6,8)
						where DelFileName like N'%.trn'

--						select * from #tblFileToBeDeleted
						if exists(select 1 from #tblFileToBeDeleted)
						begin

--							while @retention <= 0
--							begin
							

								-- Keep Full Backup Exactly per retention
								select @delFileDate = dateadd(dd,@retention, getDate())
								select @delFileDtToCh = convert(char(4),datepart(yy,@delFileDate))+
										replicate(N'0',2 - len(convert(varchar(2),datepart(mm,@delFileDate)))) + convert(varchar(2),datepart(mm,@delFileDate)) +
										replicate(N'0',2 - len(convert(varchar(2),datepart(dd,@delFileDate)))) + convert(varchar(2),datepart(dd,@delFileDate))

								select @delFileName = N'%' + @xdatabase + N'%' +  @delFileDtToCh + N'%'

								delete #tblFileToBeDeleted 
										where DelFileDate >= convert(int,@delFileDtToCh)
											and (DelFileName like N'%.bak' or DelFileName like N'%.dif')


								-- Keep +1 day extra log file for Disaster Recovery
								set @ret = @retention - 1
								
								select @delFileDate = dateadd(dd, @ret, getDate())
								select @delFileDtToCh = convert(char(4),datepart(yy,@delFileDate))+
										replicate(N'0',2 - len(convert(varchar(2),datepart(mm,@delFileDate)))) + convert(varchar(2),datepart(mm,@delFileDate)) +
										replicate(N'0',2 - len(convert(varchar(2),datepart(dd,@delFileDate)))) + convert(varchar(2),datepart(dd,@delFileDate))

								select @delFileName = N'%' + @xdatabase + N'%' +  @delFileDtToCh + N'%'

								delete #tblFileToBeDeleted 
										where DelFileDate >= convert(int,@delFileDtToCh)
												and DelFileName like N'%.trn'


--								set @retention = @retention + 1
							
--							end
							
							declare curDel cursor for select DelFileName from #tblFileToBeDeleted

							open curDel
							fetch curDel into @delFileName

							while @@fetch_status = 0
							begin

--								print 'exec(''master..xp_cmdshell ''''del ''' + @delFileName + ''''''')'
								exec(N'master..xp_cmdshell ''del ' + @delFileName + N'''')
								fetch curDel into @delFileName

							end
							close curDel
							deallocate curDel
							
						end								

						fetch curDelFile into @xdatabase, @retention, @xdiff, @xlog
				end
				close curDelFile
				deallocate curDelFile
				drop table #tblFileToBeDeleted
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[usp_dba_generate_login_defDB]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-----------------------------------------------------------------------------------------

Purpose		: Generate script for creating login (Windows and SQL) with passowrd (SQL Login only) and
				setting up default DB for all available login  
Created on	: 10/17/2006
Modified on	: 10/17/2006
Version		: 1.1

dependencies:	Table					
			tbl_dba_SQL_Logins			
			tbl_dba_window_Logins
			tbl_dba_Logins_defaultDB
----------------------------------------------------------------------------------------*/

CREATE Procedure [dbo].[usp_dba_generate_login_defDB] with encryption
as
set nocount on

truncate table tbl_dba_SQL_Logins
truncate table tbl_dba_window_Logins
truncate table tbl_dba_Logins_defaultDB

--************************Script for SQL (2000) Logins ****************************************'
	insert into tbl_dba_SQL_Logins
	select 'exec sp_addlogin ''' + ltrim(rtrim(name)) +''',' , convert(varbinary(64),password) , ', @defdb = ''' + dbname + ''',' 
		+ ' @encryptopt = ''skip_encryption'''
		--into tbl_dba_server_Logins 
		from master..syslogins where name not like '%\%'

--********************************over*******************************************'
insert into tbl_dba_SQL_Logins_05
select 'CREATE LOGIN ' + ltrim(rtrim(name)) + ' WITH PASSWORD = ' ,
		convert(varbinary(64),password), ' HASHED ' +
		', default_database=' + dbname + ',check_policy = OFF'
		from master..syslogins where name not like '%\%'

--************************ Script for Windows Logins ****************************************'
	insert into tbl_dba_window_Logins
	select 'exec sp_grantlogin ''' + ltrim(rtrim(loginname)) + '''' + char(13) 
		+ 'exec sp_defaultdb ''' + ltrim(rtrim(loginname)) + ''',''' + dbname + ''''
		from master..syslogins where loginname like '%\%'
--***************************** over *******************************************************'
--********************Script for Changing Default DB Only***************************************'
	insert into tbl_dba_Logins_defaultDB
	select 'EXEC sp_defaultdb '+''''+name+''''+', '+''''+dbname+''''
			from master..syslogins 




GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_full_backup_archive]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: 	Maintain History for Full Backup for future reference (if needed)
			This is also important in case full backup needs to run multiple times in a day
Created on	:	10/15/2006
Modified on	: 	10/15/2006
Version		:	1.1
dependencies	:	Table					
			tbl_dba_full_backup_completed		
			tbl_dba_full_backup_archive
			tbl_dba_full_backup_archive
Usage		: 	Not Specfifc
***********************************************************************/

CREATE	PROCEDURE [dbo].[usp_tbl_dba_full_backup_archive] with encryption
as
SET NOCOUNT ON

DECLARE 	 @error int
		,@rowcount int

INSERT		 dbo.tbl_dba_full_backup_archive
(		 xdatabase
		,starttime
		,endtime
		,succeeded
		,directory
)
SELECT		 xdatabase
		,starttime
		,endtime
		,succeeded
		,directory
FROM		 dbo.tbl_dba_full_backup_completed t1

SELECT 		@error = @@error, 
		@rowcount = @@rowcount

IF (@error = 0) and (@rowcount > 0)
TRUNCATE TABLE DBA..tbl_dba_full_backup_completed


GO
/****** Object:  StoredProcedure [dbo].[usp_dba_Drive_Space]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************

Purpose		: Alert for Drive that has more than 80% space full
Created on	: 10/13/2006
Modified on : 08/31/2007
Version		: 1.2
dependencies:
				Table						Procedure
				tbl_dba_Drive_Space			usp_dba_SendMail
				
*******************************************************************************************/
CREATE Procedure [dbo].[usp_dba_Drive_Space] with encryption
AS
SET NOCOUNT ON
	DECLARE @hr int
	DECLARE @fso int
	DECLARE @Drive varchar(100)
	DECLARE @odrive int
	DECLARE @TotalSize varchar(20)
	DECLARE @DateTime datetime
	DECLARE @MB bigint 

	
	
	SET @MB = 1048576

	CREATE TABLE #tbl_dba_Drive_Space 
	(
		[#Drive] [varchar] (100) NOT NULL ,
		[#TotalSizeMB] [int] NULL ,
		[#FreeSpaceMB] [int] NULL ,
		[#FreeSpacePCT] [int] NULL ,
		[#FSDateStamp] [datetime] NULL,
		[#ServerName] varchar(50) NULL
	)	

	set @DateTime = convert(varchar(10), getdate(),101)

	INSERT #tbl_dba_Drive_Space(#Drive,#FreeSpaceMB)
				EXEC master.dbo.xp_fixeddrives

	--Check if there is any network drive to be monitored
	declare @vFreeSpace varchar(100), @nFreeSpace numeric

	if exists(select 1 from DBA..tbl_dba_DriveSpace_Config where DriveName like '\\%')
	begin
		create table #tblNetworkDrive
		(
			nSNo	numeric identity(1,1),
			vOutput varchar(500)
		)
		
		declare curNWDrive cursor for select DriveName from DBA..tbl_dba_DriveSpace_Config where DriveName like '\\%'	

		open curNWDrive 

		fetch curNWDrive into @Drive
		while @@fetch_status = 0
		begin
			truncate table #tblNetworkDrive

			insert into #tblNetworkDrive (vOutput) exec ('master..xp_cmdshell ''dir ' + @Drive + '''')
			
			select @vFreeSpace = replace(ltrim(rtrim(right(vOutput,(len(vOutput) - (charindex('Dir(s)',vOutput,1)+5))))),',','') from #tblNetworkDrive where vOutput like '%Dir(s)%'
			
			select @vFreeSpace = left(@vFreeSpace,charindex(' ',@vFreeSpace,1))
			
			select @nFreeSpace = @vFreeSpace
			
			select @nFreeSpace = round((@nFreeSpace / 1024) / 1024,1)
			
--			select @nFreeSpace
			
			insert into #tbl_dba_Drive_Space(#Drive,#FreeSpaceMB)
			values(@Drive,@nFreeSpace)

			fetch curNWDrive into @Drive
		end
		close curNWDrive
		deallocate curNWDrive
		drop table #tblNetworkDrive
		
		
	end
	--***************************************************

	-- Update tbl_DriveSpace_Config for any new drive

	insert into tbl_dba_DriveSpace_Config
				select #Drive, 
						case #Drive
						when 'C' then 95
						else 85
						end 
						from #tbl_dba_Drive_Space 
						where #Drive not in(select DriveName
												from tbl_dba_DriveSpace_Config)

	UPDATE #tbl_dba_Drive_Space
	SET #FSDateStamp = @DateTime,
		#ServerName =  @@servername
	-- WHERE #FSDateStamp is null

	EXEC @hr=sp_OACreate 'Scripting.FileSystemObject',@fso OUT
	IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso
	DECLARE dcur CURSOR LOCAL FAST_FORWARD
	FOR SELECT #Drive from #tbl_dba_Drive_Space
	--WHERE #FSDateStamp = @DateTime
	ORDER by #Drive

	OPEN dcur
	FETCH NEXT FROM dcur INTO @Drive

	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC @hr = sp_OAMethod @fso,'GetDrive', @odrive OUT, @Drive
		IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso
		EXEC @hr = sp_OAGetProperty @odrive,'TotalSize', @TotalSize OUT
		IF @hr <> 0 EXEC sp_OAGetErrorInfo @odrive
		UPDATE #tbl_dba_Drive_Space
		SET #TotalSizeMB=@TotalSize/@MB, #FreeSpacePCT = ((#FreeSpaceMB/((@TotalSize/@MB)*1.0))*100.0) 
		WHERE #Drive=@Drive --and #FSDateStamp = @DateTime
		FETCH NEXT FROM dcur INTO @Drive
	END
	CLOSE dcur
	DEALLOCATE dcur
	EXEC @hr=sp_OADestroy @fso
	IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

	TRUNCATE TABLE tbl_dba_Drive_Space

	INSERT INTO tbl_dba_Drive_Space
	SELECT 
		#Drive as 'Drive',
		#TotalSizeMB as 'Total(MB)',
		#FreeSpaceMB as 'Free(MB)',
		#FreeSpacePCT as 'Free(%)',
		#FSDateStamp as 'Date Checked',
		#ServerName as 'Server Name'  

	FROM #tbl_dba_Drive_Space
	ORDER BY #Drive 
	--RETURN
	drop table #tbl_dba_Drive_Space

	declare @FreeSpacePCT int, @Threshold int
	set @FreeSpacePCT = 0
	set @Drive = ''

	declare curCheckThreshold cursor for
			select Drive, FreeSpacePCT, Threshold
					from tbl_dba_Drive_Space t, tbl_dba_DriveSpace_Config t1
					where t.Drive = t1.DriveName and t.FreeSpacePCT<(100-t1.Threshold)
	
	open curCheckThreshold
	fetch curCheckThreshold into @Drive, @FreeSpacePCT, @Threshold
	declare @Subject varchar(100), @Body nvarchar(4000)
	set @Subject  = 'Warning - Disk Space crossed threshold (It may include NAS drive)'
	set @Body = 'Drive Name' + replicate(' ',50) + ' Current (%)               Threshold(%)' + char(13)

	while @@fetch_status = 0
	begin
		
		set @Body = @Body + @Drive + replicate(' ',50) + convert(varchar,100-@FreeSpacePCT) + '                       ' + convert(varchar,@Threshold) + char(13)

		fetch curCheckThreshold into @Drive, @FreeSpacePCT, @Threshold
	end

	close curCheckThreshold
	deallocate curCheckThreshold

	if @Drive<>'' 
	begin
		set @Body = @Body + char(13) + ' Please run query : "select * from DBA..tbl_dba_Drive_Space" on Server : ' + @@ServerName + ' for detail'
		EXEC DBA..usp_dba_SendMail
			@JobType = 'DiskSpace'
			,@Subject = @Subject
			, @Body = @Body
	end

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_block_main]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Description	: 	Main(Control) Script for Blocking alert
Created on	:	
Modified on	:	10/15/2006
Version		:	1.1
Dependencies:
				Table									Procedure
				tbl_dba_Block_Interval_Config			usp_dba_block_record
														usp_dba_block_alert
----------------------------------------------------------------------------------------------------------------------------*/

CREATE procedure [dbo].[usp_tbl_dba_block_main] with encryption
as
SET NOCOUNT ON
	DECLARE @block_occurred_bit bit,
			@blocking_time_interval int		-- time in seconds comes from config table
	
		select	@blocking_time_interval=BlockInterval
				from tbl_dba_Block_Interval_Config

		-- Record blocking
		EXEC usp_dba_block_record @fast = 1, 
			@block_occurred_bit = @block_occurred_bit output

		-- Analyze blocking and send alert if blocking duration exceeded
		IF @block_occurred_bit = 1
		   EXEC DBA..usp_dba_block_alert 
				@blocking_time_interval = @blocking_time_interval-- time interval in second




GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_full_backup]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER OFF
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: Run Full database backup based on database list from "tbl_dba_maintenance_config base"
		  where value in column "xfull" is "Y"
Created on	:	10/14/2006
Modified on	: 	01/07/2007
Version		:	1.2
dependencies	: Table					Procedure
		  tbl_dba_maintenance_config			usp_tbl_dba_maintenance_u
		  tbl_dba_full_backup_completed
		  tbl_dba_full_backup_archive
Usage: 

exec DBA..usp_tbl_dba_full_backup @database = 'MSDB' 	--> (for more than 1 database seperate by semicolon)	-- optional
				 ,@directory = 'D:\MSSQL\Backup' --> (location for backup) 				-- optional IF path is set in tbl_dba_backup_location 
				 ,@sequence = 1 	--> (number of backup files to split)			-- optional (1 is the default)
				 ,@check = 'N' 		--> (check table tbl_dba_maintenance_config for 		-- default is 'N'
							     database(s) flagged('Y') for full backup)  	
				 ,@execute = 'N'	--> (execute backup('Y'),if 'N' then 			-- default is 'N'			
							     display the command)
				 ,@mkdir = 'Y'		--> (creates the backup directory path			-- default is 'Y'	
				 ,@withstats = '	--> (display percentage of backup completed)		-- default is ''

Note:	

If [@check] = 'Y'  - 	this will backup all databases in table "DBA..tbl_dba_maintenance_config" where  column "xfull" = 'Y'
			
--------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE procedure [dbo].[usp_tbl_dba_full_backup]
(
	@database varchar(250) = null,
	@directory varchar(100) = null,
	@sequence int = 1,
	@check char(1) = 'N',
	@execute char(1) = 'N',
	@verify char(1) = 'N',
	@mkdir char(1) = 'Y',
	@withstats varchar(3) = ''
) with encryption
as
begin
set nocount on

declare @sql varchar(5000),
        @file_name varchar(100),
		@exec_md varchar(500),
		@error int,
		@sequenceloop int,
		@dirNullFlag char(1),
		@verifyFile varchar(5000)

set @sequenceloop = @sequence

declare @Compression char(1) = 'N';

set @verifyFile = ''

if @directory is null
begin
	set @dirNullFlag = 'Y' -- change in code #MK#
	select @directory = db_full_bkup_location from DBA..tbl_dba_maint_file_location
end

if right(@directory,1) = '\' select @directory = @directory + @@servername
else select @directory = @directory + '\' + @@servername

if @directory is null or len(@directory) < 1
begin
	 raiserror('A valid backup location (@directory) must be provided, or set the backup location in DBA..tbl_dba_backup_location',16,1)
	 return
end
create table #tblBkupLocation
(
	directory varchar(150)
)

if @database is not null
begin

	if right(@directory,1) <> '\' set @directory = @directory + '\'

	declare @database_update varchar(500),@string_len int, @database_list varchar(500),@find_semi int, @loop char(1)
	
	select @database_list = @database, @string_len = len(@database_list), @loop = 'N'
	
	select 'FULL BACKUP' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
	+ convert(varchar(20),getdate(),9) as 'Date_Time'

	if @execute <> 'Y' select 'SET @execute = ''Y'' ' as '**To Perform FULL Backup**' 

	select @database_update = replace(@database_list,',',';')

        while @database_update is not null
	        begin
			select @find_semi = patindex ('%;%',@database_update), @sequence = @sequenceloop
			
			if @find_semi <> 0	  
		        begin
		  	 	select @database = ltrim(rtrim(substring(@database_update,1,(@find_semi - 1))))
					
				if (databasepropertyex(@database,'status') <> 'ONLINE') or (databasepropertyex(@database,'status') is null)
				begin
					print  'database ' + @database + ' is invalid or database status is not online' 
					select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1)
						,@string_len))
						,@sql = null
						,@loop = 'Y'
					continue
				end        
	
				set @sql = isnull(@sql,'') + 'backup database [' + @database + '] to '

				set @verifyFile = @verifyFile + 'restore verifyonly from '

				while @sequence > 0
				begin
					select @file_name = '_db_' +
				       	convert(char(4),datepart(yy,getdate()) )+
				       	replicate('0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
				       	replicate('0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
				       	replicate('0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
				       	replicate('0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
				       	+ convert(varchar(5),@sequence) + '.bak'	
					
					if @dirNullFlag = 'N'
					begin
						set @sql = @sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''

						set @verifyFile = @verifyFile + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''
						--create backup directory folders
						if @mkdir = 'Y'
						begin
							select @exec_md =  'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
							exec (@exec_md)
						end
					end
					else
					begin
						truncate table #tblBkupLocation

						insert into #tblBkupLocation exec('select top ' + @sequence + ' db_full_bkup_location from DBA..tbl_dba_maint_file_location')
						select @directory = directory from #tblBkupLocation

						if right(@directory,1) = '\' select @directory = @directory + @@servername
						else select @directory = @directory + '\' + @@servername

						if right(@directory,1) <> '\' set @directory = @directory + '\'

						--create backup directory folders
						if @mkdir = 'Y'
						begin
							select @exec_md = 'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
							exec (@exec_md)
						end

						set @sql = @sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''

						set @verifyFile = @verifyFile + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''
					end
					
					if @sequence > 1
					begin
						select @sql = @sql + ',' + char(13)
						select @verifyFile = @verifyFile + ',' + char(13)
					end
--						else
--							select @sql = @sql + ' with stats=' + @withstats

					set @sequence  = @sequence - 1
				
				end
				
				Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database
				
				if @withstats != ''
					select @sql = @sql + ' with stats=' + @withstats					 

				if @Compression = 'Y'
				begin
					if @withstats != ''
						select @sql = @sql + ', compression'
					else
						select @sql = @sql + ' with compression'
				end

				if @execute = 'N'
				begin	
					select @sql as 'command to execute'
				end
				else
				begin
					--execute backup		
					exec (@sql)
					if @verify = 'Y'
					begin
						print 'Verify Started.....'

						exec(@verifyFile)
						
						print 'Verify Over'
	
					end					
				end
		        	
				---
				
				select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1),@string_len))
					,@sql = null
					,@loop = 'Y'

				continue
	        	end	
			else
			begin
				set @sequence = @sequenceloop 
				
			  	if @loop = 'Y' 	select @database = @database_update
			 	
				if (databasepropertyex(@database,'status') <> 'ONLINE') or (databasepropertyex(@database,'status') is null)
				begin
					print  'database ' + @database + ' is invalid or database status is not online' 
				end
				else     
			  	begin

					set @sql = isnull(@sql,'') + 'backup database [' + @database + '] to '
				
					set @verifyFile = 'restore verifyonly from '

					while @sequence > 0
					begin

						select @file_name = '_db_' +
					       	convert(char(4),datepart(yy,getdate()) )+
					       	replicate('0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
					       	replicate('0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
					       	replicate('0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
					       	replicate('0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
					       	+ convert(varchar(5),@sequence) + '.bak'	
					if @dirNullFlag = 'N'
					begin
						set @sql = @sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''

						set @verifyFile = @verifyFile + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''
						--create backup directory folders
						if @mkdir = 'Y'
						begin
							select @exec_md =  'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
							exec (@exec_md)
						end
					end
					else
					begin
						truncate table #tblBkupLocation

						insert into #tblBkupLocation exec('select top ' + @sequence + ' db_full_bkup_location from DBA..tbl_dba_maint_file_location')
						select @directory = directory from #tblBkupLocation

						if right(@directory,1) = '\' select @directory = @directory + @@servername
						else select @directory = @directory + '\' + @@servername

						if right(@directory,1) <> '\' set @directory = @directory + '\'

						--create backup directory folders
						if @mkdir = 'Y'
						begin
							select @exec_md = 'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
							exec (@exec_md)
						end

						set @sql = @sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''

						set @verifyFile = @verifyFile + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''
					end


						if @sequence > 1
						begin

							select @sql = @sql + ',' + char(13)
							select @verifyFile = @verifyFile + ',' + char(13)

						end
--						else
--							select @sql = @sql + ' with stats=' + @withstats

						set @sequence  = @sequence - 1
					

					end

					Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database

					if @withstats <> ''
						select @sql = @sql + ' with stats=' + @withstats
					
					if @Compression = 'Y'
					begin
						if @withstats != ''
							select @sql = @sql + ', compression'
						else
							select @sql = @sql + ' with compression'
					end
					
					if @execute = 'N'
					begin
					   	select @sql as 'command to execute'
					end
					else
					begin	
						--execute backup
						exec (@sql)
						if @verify = 'Y'
						begin
							print 'Verify Started.....'

							exec(@verifyFile)
							
							print 'Verify Over.'
		
						end					

					end
			  	end
				select @database_update = null
		        end
		end
	select @sql = null--, @database = null
end


if @check <> 'Y'
	if @database is null
	begin
		 print 'the parameter [@check] must be set to ''Y'' in order to backup all databases in [tbl_dba_maintenance_config] where column [xfull] = ''Y''	'
		 return
	end
	else
	begin
		if @database is not null 
			return
	end

--check_tbl:

		--update table tbl_dba_maintenance_config 
	exec DBA..usp_tbl_dba_maintenance_u

	
	--display database in tbl_dba_maintenance_config set for FULL Backup
	--print ' '
	--select '***Database Flagged for FULL Backup in tbl_dba_maintenance_config***' = [xdatabase] from DBA..tbl_dba_maintenance_config
	--where [xfull] <> 'N' and [xskip] <> 1	
	--
	--display message
	if @execute = 'N'
	begin 
		select 'set @execute = ''Y''' as '**To Perform Backup**'
	--	print 'This parameter is valid only when you are passing individual database name thru @database parameter'
		return
	end
	else
	begin
		insert into 	 DBA..tbl_dba_full_backup_completed
		(		 xdatabase
				,directory
		)
		select 	 	 a.xdatabase
				,@directory 
		from 		 DBA..tbl_dba_maintenance_config a
		where		 a.[xfull] <> 'N'
		and		 a.[xskip] <> 1
		and		 a.xdatabase not in (select xdatabase from DBA..tbl_dba_full_backup_completed)
	end

	if right(@directory,1) <> '\' set @directory = @directory + '\'

	declare cur_db_backup cursor for
	select 		 a.xdatabase
			,a.xsequence,a.xVerify
	from 		DBA..tbl_dba_maintenance_config a
		join	DBA..tbl_dba_full_backup_completed b
		on 	a.xdatabase = b.xdatabase
	where 		b.succeeded is null 
	order by a.xdatabase
--	group by 	a.xdatabase,a.xsequence

	open cur_db_backup
	fetch next from cur_db_backup into @database,@sequence,@verify
	while @@fetch_status = 0
	begin
		if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
		begin
			print ' '
			print 'backup error: ' + @database               				
	   		print 'database ' + @database + ' is not online'
        		goto next_db	
		end	
		
		set @sql = isnull(@sql,'') + 'backup database [' + @database + '] to '

		set @verifyFile = 'restore verifyonly from '

		while @sequence > 0
		begin

			select @file_name = '_db_' +
			convert(char(4),datepart(yy,getdate()) )+
			replicate('0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
			replicate('0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
			replicate('0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
			replicate('0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
			+ convert(varchar(5),@sequence) + '.bak'	
			
			if @dirNullFlag = 'N'
			begin
				--create backup directory folders
				set @sql=@sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''

				set @verifyFile = @verifyFile + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''

				if @mkdir = 'Y'
				begin
					select @exec_md =  'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
					exec (@exec_md)
				end
			end
			else
			begin
				truncate table #tblBkupLocation

				insert into #tblBkupLocation exec('select top ' + @sequence + ' db_full_bkup_location from DBA..tbl_dba_maint_file_location')
				select @directory = directory from #tblBkupLocation

				if right(@directory,1) = '\' select @directory = @directory + @@servername
				else select @directory = @directory + '\' + @@servername

				if right(@directory,1) <> '\' set @directory = @directory + '\'
				--create backup directory folders
				if @mkdir = 'Y'
				begin
					select @exec_md =  'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
					exec (@exec_md)
				end

				set @sql=@sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''

				set @verifyFile = @verifyFile + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''
			end
			
			if @sequence > 1
			begin
				select @sql = @sql + ',' + char(13)
				select @verifyFile = @verifyFile + ',' + char(13)
			end

	--		else
	--			select @sql = @sql + ' with stats=' + @withstats

		 
			set @sequence  = @sequence - 1
		
		end
		
		Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database
		
		if @withstats <> ''
			select @sql = @sql + ' with stats=' + @withstats

		if @Compression = 'Y'
		begin
			if @withstats != ''
				select @sql = @sql + ', compression'
			else
				select @sql = @sql + ' with compression'
		end


		-- log backup status to tbl_dba_full_backup_completed

		update 		tbl_dba_full_backup_completed
		set 		starttime 	= 	getdate(),
				directory	= 	@directory
		where 		xdatabase 	= 	@database

		print ' '
		print @database
		--print @sql
		exec (@sql)
		if @verify = 'Y'
		begin

			print 'verify Started....'

			exec (@verifyFile)

			print 'verify over'
		end

		select @error = @@error 
			
			--update endtime and backup status 
		update 		tbl_dba_full_backup_completed
		set 		endtime 	= 	getdate(), 
				succeeded 	= 	case when @error = 0 then 1 end 
		where 		xdatabase 	= 	@database
			--
	 	
			set @sql = null

	next_db:
	fetch next from cur_db_backup into @database,@sequence,@verify
	end
	close cur_db_backup
	deallocate cur_db_backup

	drop table #tblBkupLocation
end


GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_log_backup]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: Run Full database backup based on database list from "tbl_dba_maintenance_config"
		  where value in column "xlog" is "Y"
Created on	:	10/13/2006
Modified on	: 	01/07/2007
Version		:	1.2
dependencies	: Table					Procedure
		  tbl_dba_maint_file_location		usp_tbl_dba_maintenance_u
		  tbl_dba_maintenance_config
usage: 
		exec DBA..usp_tbl_dba_log_backup 
			@database = 'DBA',				--> 	Backup Individual Database (optional)
			@directory = 'D:\MSSQL\Backup', 		-->	Backup Location 
			@check = 'Y' 					--> 	'N' - do not backup database in tbl_db_maintenance(default)
					   				--	'Y' - check and run backup for all db available in tbl_db_maintenance				
			,@execute = 'Y' 				-->  	'N' - To see backup command without executing
					      					'Y' - Execute backup command
note:
if [@check] = y this will backup all database in table DBA..tbl_dba_maintenance_config with flag 

----------------------------------------------------------------------------------------------------------------------------*/
create procedure [dbo].[usp_tbl_dba_log_backup]
(
	@database varchar(100) = NULL,
	@directory varchar(100) = NULL,
    @check char(1) = N'N',
    @execute char(1) = N'N',
    @mkdir char(1) = N'Y'
) with encryption
as
begin
set nocount on
declare @sql varchar(5000),
        @file_name varchar(100),
        @exec_md varchar(500),
        @backupID int,
        @error int 

declare @Compression char(1) = N'N';

if @directory is null select top 1 @directory = db_tran_bkup_location from DBA..tbl_dba_maint_file_location
if right(@directory,1) = N'\' select @directory = @directory + @@servername
else select @directory = @directory + N'\' + @@servername

if @directory is null or len(@directory) < 1
begin
	 raiserror(N'A valid backup location (@directory) must be provided, or set the backup location in DBA..tbl_dba_maint_file_location',16,1)
	 return
end

if @database is not null
begin
	
	if right(@directory,1) <> N'\' set @directory = @directory + N'\'
	
	declare @database_update varchar(500),@string_len int, @database_list varchar(500),@find_semi int, @loop char(1)
	
	select @database_list = @database, @string_len = len(@database_list), @loop = N'N'

	select N'Transaction Log BACKUP' as N'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as N'Target_Database', 
	+ convert(varchar(20),getdate(),9) as N'Date_Time'

	if @execute <> N'Y' select N'SET @execute = ''Y'' ' as N'**To Perform Backup**' 

	select @database_update = replace(@database_list,N',',N';')
	
	while @database_update is not null
	        begin
		  	select @find_semi = patindex (N'%;%',@database_update)--, @sequence = @sequenceloop
			
			 if @find_semi <> 0	  
		         begin
		  	 	select @database = ltrim(rtrim(substring(@database_update,1,(@find_semi - 1))))
			--	
				if (databasepropertyex(@database,N'status') <> N'ONLINE') or (databasepropertyex(@database,N'status') is null)
				begin
					print  N'database : [' + @database + N'] is invalid or database status is not online' 
					select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1)
						,@string_len))
						,@sql = null
						,@loop = N'Y'
					continue
				end

				if (databasepropertyex(@database,N'recovery')=N'simple')
				begin
					print N'log backup is not a valid option for database [' + @database + N'] because it is in simple recovery mode'
					select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1)
						,@string_len))
						,@sql = null
						,@loop = N'Y'
					continue
				end

				--Cheking if the database is primary logshipping, if yes then do not get a backup and the go to next database
				if (DBA.dbo.ufn_dba_IsLogShippingDatabase(@database) = N'Y')
				begin
					print N' '
					print N'database [' + @database + N'] is primary logshipping'                 				
					print N'call logshipping backup job to get a TLog backup'
					select N'***Database Flagged for Logshipping***' AS Logshipping
					UNION ALL
					select N'Call logshipping backup job to get a TLog backup'
						continue	
				end

				set @sql = isnull(@sql,N'') + N'backup log [' + @database + N'] to '

				select @file_name = N'_tlog_' +
			       	convert(char(4),datepart(yy,getdate()) )+
			       	replicate(N'0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
			       	replicate(N'0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
			       	replicate(N'0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
			       	replicate(N'0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
			       	+ N'.trn'
	
				set @sql = @sql + N'disk = ''' + @directory + replace(@database,N' ',N'') + N'\' + replace(@database,N' ',N'') + @file_name + N''''
	
				Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = N'Y' THEN xCompression ELSE N'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database
				
				if @Compression = N'Y'
					select @sql = @sql + N' with compression'
	
				if @execute = N'N'
				begin
					select @sql as N'command to execute'
				end
				else
				begin
					--check if another backup process is running on same database
					if exists(select * from master..sysprocesses (nolock) where dbid = db_id(@database) and cmd like N'backup %')
						begin
							print N'Another backup process is currently running for database ' + @database	
							select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1),@string_len))
							,@sql = null
							,@loop = N'Y'
							continue
						end

					--create backup directory folders
					if @mkdir = N'Y'
					begin
						select @exec_md = N'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,N' ',N'') + N''', no_output'
						exec (@exec_md)
					end
					
					--execute backup log command
					exec (@sql)
				end
				
				select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1),@string_len))
					,@sql = null
					,@loop = N'Y'

				continue
		         end
			else
			begin
				--set @sequence = @sequenceloop 
				
			  	if @loop = N'Y'
                  select @database = @database_update,@sql = null
				
				if (databasepropertyex(@database,N'recovery')=N'simple')
				begin
					print N'log backup is not a valid option for database [' + @database + N'] because it is in simple recovery mode'
				end

				if (databasepropertyex(@database,N'status') <> N'ONLINE') or (databasepropertyex(@database,N'status') is null)
				begin
					print  N'database [' + @database + N'] is invalid or database status is not online' 
				end
				else
				begin

					--Cheking if the database is primary logshipping, if yes then do not get a backup and the go to next database
					if (DBA.dbo.ufn_dba_IsLogShippingDatabase(@database) = N'Y')
					begin
						print N' '
						print N'database [' + @database + N'] is primary logshipping'                 				
						print N'call logshipping backup job to get a TLog backup'
						select N'***Database Flagged for Logshipping***' AS Logshipping
						UNION ALL
						select N'Call logshipping backup job to get a TLog backup'
					end
					else
					begin
						set @sql = isnull(@sql,N'') + N'backup log [' + @database + N'] to '
		
						select @file_name = N'_tlog_' +
				       		convert(char(4),datepart(yy,getdate()) )+
				       		replicate(N'0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
				       		replicate(N'0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
				       		replicate(N'0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
				       		replicate(N'0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
				       		+ N'.trn'
			
						set @sql = @sql + N'disk = ''' + @directory + replace(@database,N' ',N'') + N'\' + replace(@database,N' ',N'') + @file_name + N''''
			
						Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database
					
						if @Compression = N'Y'
							select @sql = @sql + N' with compression'

						if @execute = N'N'
						begin
							--select N'set @execute = ''Y'' ' as '**To Perform Log Backup**'
							select @sql as N'command to execute'
						end
						else
						begin
							--check if another backup process is running on same database
							if exists(select * from master..sysprocesses (nolock) where dbid = db_id(@database) and cmd like 'backup %')
								begin
									print N'Another backup process is currently running for database [' + @database	+ N']'
									select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1)
									,@string_len))
									,@sql = null
									,@loop = N'Y'
								end

							--create backup directory folders
							if @mkdir = N'Y'
							begin
								select @exec_md = N'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,N' ',N'') + N''', no_output'
								exec (@exec_md)
							end
							
							--execute backup log command
							exec (@sql)
						end
					end
				end
			end
			select @database_update = null
	end		
	--
	set @sql = null
end

if @check <> N'Y'
 if @database is null
  begin
	print N''	 
	print N'
	setting parameter [@check] = ''Y'' will start Transaction Log backup on all database(s) in table DBA..tbl_dba_maintenance_config
	where column name [xlog] has value of ''Y''	'
	return
  end

check_tbl:

if @check = N'N'
return
	--update table tbl_dba_maintenance_config
exec DBA..usp_tbl_dba_maintenance_u
	--
	--display database in tbl_dba_maintenance_config set for Transaction Log Backup
print N' '
select N'***Database Flagged for Backup in tbl_dba_maintenance_config***' = [xdatabase] from DBA..tbl_dba_maintenance_config
where [xlog] <> N'N' and [xskip] <> 1
	--
	--display message
if @execute = N'N'
begin
	select N'set @execute = ''Y'' ' as N'**To Perform Backup**'
end

if right(@directory,1) <> N'\' set @directory = @directory + N'\'

declare cur_db_backup cursor for
	select [xdatabase]
	from DBA..tbl_dba_maintenance_config
	where [xlog] <> N'N'
	and [xskip] <> 1
	
open cur_db_backup
fetch next from cur_db_backup into @database
while @@fetch_status = 0
begin
	
	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
	begin
		print N'log backup error: [' + @database + N']'
	   	print N'database is not online'
        	goto next_db	
	end
	
	if (databasepropertyex(@database,N'recovery')= N'simple')
	begin
		print N' '
		print N'log backup error: [' + @database + N']'
	   	print N'log backup is not a valid option for database [' + @database + N'] because it is in simple recovery mode'
	       	goto next_db	
	end
	
	--Cheking if the database is primary logshipping, if yes then do not get a backup and the go to next database
if (DBA.dbo.ufn_dba_IsLogShippingDatabase(@database) = N'Y')
begin
	print N' '
	print N'database [' + @database + N'] is primary logshipping'                 				
	print N'call logshipping backup job to get a TLog backup'
	select N'***Database Flagged for Logshipping***' AS Logshipping
	UNION ALL
	select N'Call logshipping backup job to get a TLog backup'
		goto next_db	
end

	set @sql = isnull(@sql,N'') + N'backup log [' + @database + N'] to '
		
	select @file_name = N'_tlog_' +
       		convert(char(4),datepart(yy,getdate()) )+
       		replicate(N'0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
       		replicate(N'0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
       		replicate(N'0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
       		replicate(N'0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
       		+ N'.trn'
	set @sql = @sql + N'disk = ''' + @directory + replace(@database,N' ',N'') + N'\' + replace(@database,N' ',N'') + @file_name + N''''
	--	
	Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database
	
	if @Compression = N'Y'
		select @sql = @sql + N' with compression'

	if @execute = N'N'
	begin
	   	select @sql as N'command to execute'
	end
	else	
	begin 	
		--check if another backup process is running on the same database
		if exists(select * from master..sysprocesses (nolock)where dbid = db_id(@database) and cmd like N'backup %')
			begin
				print N'Another backup process is currently running for database ' + @database
				set @sql = null
				goto next_db
			end

		--create backup directory folders
		if @mkdir = N'Y'
		begin
			select @exec_md =  N'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,N' ',N'') + N''', no_output'
			exec (@exec_md)
		end
		
		print N' '
		print @database
		exec (@sql)
	--
	end
        set @sql = null

next_db:
fetch next from cur_db_backup into @database
end
close cur_db_backup
deallocate cur_db_backup
end



GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_diff_backup]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Description	: 	runs differential database backup on table "tbl_dba_maintenance_config base" on set values in column "xdiff"
Created on	:	10/14/2006
Modified on	: 	01/07/2006
Version		:	1.2
dependencies:	Table					Procedure
		tbl_dba_maintenance_config			usp_tbl_dba_maintenance_u
		tbl_dba_full_backup_completed
		tbl_dba_full_backup_archive
usage: 

exec DBA..usp_tbl_dba_diff_backup @database = 'DBA' 	--> (for more than 1 database seperate by semicolon)	-- optional
				 ,@directory = 'D:\MSSQL\Backup' --> (location for backup) 				-- optional IF path is set in tbl_dba_backup_location 
				 ,@sequence = 1 	--> (number of backup files to split)			-- optional (1 is the default)
				 ,@check = 'N' 		--> (check table tbl_dba_maintenance_config for 		-- default is 'N'
							     database(s) flagged('Y') for differential backup)  	
				 ,@execute = 'N'	--> (execute backup('Y'),if 'N' then 			-- default is 'N'			
							     display the command)
				 ,@mkdir = 'Y'		--> (creates the backup directory path			-- default is 'Y'	
				 ,@withstats = '	--> (display percentage of backup completed)		-- default is ''

Note:	
If [@check] = 'Y'  - 	this will backup all databases in table "DBA..tbl_dba_maintenance_config" where  column "xdiff" = 'Y'
			
--------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


CREATE procedure [dbo].[usp_tbl_dba_diff_backup]
(
	@database varchar(250) = null,
	@directory varchar(100) = null,
	@sequence int = 1,
	@check char(1) = 'N',
	@execute char(1) = 'N',
	@mkdir char(1) = 'Y',
	@withstats varchar(20) = ''
) with encryption
as
begin
set nocount on

declare @sql varchar(5000),
        @file_name varchar(100),
		@exec_md varchar(500),
		@error int,
		@sequenceloop int,
		@dirNullFlag char(1)
 
declare @Compression char(1) = 'N';
 
set @sequenceloop = @sequence

if @directory is null
begin
	set @dirNullFlag = 'Y'
	select @directory = db_diff_bkup_location from DBA..tbl_dba_maint_file_location
end

if right(@directory,1) = '\' select @directory = @directory + @@servername
else select @directory = @directory + '\' + @@servername

if @directory is null or len(@directory) < 1
begin
	 raiserror('A valid backup location (@directory) must be provided, or set the backup location in DBA..tbl_dba_backup_location',16,1)
	 return
end
create table #tblBkupLocation
(
	directory varchar(150)
)

if @database is not null
begin
	if right(@directory,1) <> '\' set @directory = @directory + '\'

	declare @database_update varchar(500),@string_len int, @database_list varchar(500),@find_semi int, @loop char(1)
	
	select @database_list = @database, @string_len = len(@database_list), @loop = 'N'
	
	select 'DIFFERENTIAL BACKUP' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
	+ convert(varchar(20),getdate(),9) as 'Date_Time'

	if @execute <> 'Y' select 'SET @execute = ''Y'' ' as '**To Perform DIFFERENTIAL Backup**' 

	select @database_update = replace(@database_list,',',';')

        while @database_update is not null
	    begin
			select @find_semi = patindex ('%;%',@database_update), @sequence = @sequenceloop
			
			if @find_semi <> 0	  
		    begin
	
		  	 	select @database = ltrim(rtrim(substring(@database_update,1,(@find_semi - 1))))

				if (databasepropertyex(@database,'status') <> 'ONLINE') or (databasepropertyex(@database,'status') is null)
				begin
					print  'database ' + @database + ' is invalid or database status is not online' 
					select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1)
						,@string_len))
						,@sql = null
						,@loop = 'Y'
					continue
				end        
				-- Delete old  backup files
				exec DBA..usp_tbl_dba_delete_backup @database= @database , @bkupType = 'DIFF',@execute ='Y'
				--***********************************

				set @sql = isnull(@sql,'') + 'backup database [' + @database + '] to '
				while @sequence > 0
				begin
					select @file_name = '_db_' +
				       	convert(char(4),datepart(yy,getdate()) )+
				       	replicate('0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
				       	replicate('0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
				       	replicate('0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
				       	replicate('0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
				       	+ convert(varchar(5),@sequence) + '.dif'	
			
					if @dirNullFlag = 'N'
					begin
						set @sql = @sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''
						--create backup directory folders
						if @mkdir = 'Y'
						begin
							select @exec_md =  'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
							exec (@exec_md)
						end
					end
					else
					begin
						truncate table #tblBkupLocation

						insert into #tblBkupLocation exec('select top ' + @sequence + ' db_full_bkup_location from DBA..tbl_dba_maint_file_location')
						select @directory = directory from #tblBkupLocation

						if right(@directory,1) = '\' select @directory = @directory + @@servername
						else select @directory = @directory + '\' + @@servername

						if right(@directory,1) <> '\' set @directory = @directory + '\'

						--create backup directory folders
						if @mkdir = 'Y'
						begin
							select @exec_md = 'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
							exec (@exec_md)
						end

						set @sql = @sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''

					end
				
					Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database
				
					if @sequence > 1
						select @sql = @sql + ',' + char(13)
					else
						begin 
							if len(@withstats) > 0 
								select @sql = @sql + ' with differential, ' + replace(@withstats,'with','')
							else
								select @sql = @sql + ' with differential'
								
							if @Compression = 'Y'
								select @sql = @sql + ', compression'
						end
				 
					set @sequence  = @sequence - 1
				
				end
			
				if @execute = 'N'
				begin	
					select @sql as 'command to execute'
				end
				else
				begin
					--create backup directory folders
					if @mkdir = 'Y'
					begin
						select @exec_md = 'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
						exec (@exec_md)
					end
					--execute backup		
					exec (@sql)
				end
		        	
				---
				
				select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1),@string_len))
					,@sql = null
					,@loop = 'Y'

				continue
	        	end	
			else
			begin
	
				set @sequence = @sequenceloop 
				
			  	if @loop = 'Y' 	select @database = @database_update
			 	
				if (databasepropertyex(@database,'status') <> 'ONLINE') or (databasepropertyex(@database,'status') is null)
				begin
					print  'database ' + @database + ' is invalid or database status is not online' 
				end
				else     
			  	begin
					-- Delete old  backup files
					exec DBA..usp_tbl_dba_delete_backup @database= @database , @bkupType = 'DIFF',@execute ='Y'
					--***********************************

					set @sql = isnull(@sql,'') + 'backup database [' + @database + '] to '
					while @sequence > 0
					begin

						select @file_name = '_db_' +
					       	convert(char(4),datepart(yy,getdate()) )+
					       	replicate('0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
					       	replicate('0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
					       	replicate('0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
					       	replicate('0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
					       	+ convert(varchar(5),@sequence) + '.dif'	

						if @dirNullFlag = 'N'
						begin
							set @sql = @sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''
							--create backup directory folders
							if @mkdir = 'Y'
							begin
								select @exec_md =  'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
								exec (@exec_md)
							end
						end
						else
						begin
							truncate table #tblBkupLocation

							insert into #tblBkupLocation exec('select top ' + @sequence + ' db_full_bkup_location from DBA..tbl_dba_maint_file_location')
							select @directory = directory from #tblBkupLocation

							if right(@directory,1) = '\' select @directory = @directory + @@servername
							else select @directory = @directory + '\' + @@servername

							if right(@directory,1) <> '\' set @directory = @directory + '\'

							--create backup directory folders
							if @mkdir = 'Y'
							begin
								select @exec_md = 'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
								exec (@exec_md)
							end

							set @sql = @sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''

						end
							
						Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database

						if @sequence > 1
							select @sql = @sql + ',' + char(13)
						else
						begin 
							if len(@withstats) > 0 
								select @sql = @sql + ' with differential, ' + replace(@withstats,'with','')
							else
								select @sql = @sql + ' with differential'
								
							if @Compression = 'Y'
								select @sql = @sql + ', compression'
						end
					 
						set @sequence  = @sequence - 1
					
					end
			
					if @execute = 'N'
					begin
					   	select @sql as 'command to execute'
					end
					else
					begin	
						--create backup directory folders
						if @mkdir = 'Y'
						begin
							select @exec_md = 'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
							exec (@exec_md)
						end
						--execute backup
						exec (@sql)
					end
			  	end
				select @database_update = null
		        end
		end
	select @sql = null--, @database = null
end


if @check <> 'Y'
 if @database is null
 begin
	     print ''	
	     print 'the parameter [@check] must be set to ''Y'' in order to backup all databases in [tbl_dba_maintenance_config] where column [xdiff] = ''Y''	'
	     return
 end

check_tbl:

if @check = 'N'
return
print 'hello'
set @database = null

	--update table tbl_dba_maintenance_config 
exec DBA..usp_tbl_dba_maintenance_u
	--
	--display database in tbl_dba_maintenance_config set for DIFFERENTIAL Backup
print ' '
select '***Database Flagged for DIFFERENTIAL Backup in tbl_dba_maintenance_config***' = [xdatabase] from DBA..tbl_dba_maintenance_config
where [xdiff] <> 'N' and [xskip] <> 1
	--
	--display message

	if @execute = 'N'
	begin 
		select 'set @execute = ''Y'' ' as '**To Perform Backup**'
	end

	if right(@directory,1) <> '\' set @directory = @directory + '\'

	/*REMOVE THE SEQUENCE OPTION for Differential when checking table tbl_dba_maintenance_config*/
	declare cur_db_backup cursor for
	select 	 a.[xdatabase]
	from 		DBA..tbl_dba_maintenance_config a
	where 		a.xdiff <> 'N'
	and		a.xskip <> 1

	open cur_db_backup

	fetch next from cur_db_backup into @database
	while @@fetch_status = 0
	begin
		if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
		begin
			print ' '
			print 'backup error: ' + @database               				
	   		print 'database ' + @database + ' is not online'
        		goto next_db	
		end	
		-- Delete old  backup files
		exec DBA..usp_tbl_dba_delete_backup @database= @database , @bkupType = 'DIFF',@execute ='Y'
		--***********************************

		set @sequence = @sequenceloop
		set @sql = isnull(@sql,'') + 'backup database [' + @database + '] to '
		while @sequence > 0
		begin

			select @file_name = '_db_' +
			convert(char(4),datepart(yy,getdate()) )+
			replicate('0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
			replicate('0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
			replicate('0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
			replicate('0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
			+ convert(varchar(5),@sequence) + '.dif'	
			
			if @dirNullFlag = 'N'
			begin
				--create backup directory folders
				set @sql=@sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''
				if @mkdir = 'Y'
				begin
					select @exec_md =  'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
					exec (@exec_md)
				end
			end
			else
			begin
				truncate table #tblBkupLocation

				insert into #tblBkupLocation exec('select top ' + @sequence + ' db_full_bkup_location from DBA..tbl_dba_maint_file_location')
				select @directory = directory from #tblBkupLocation

				if right(@directory,1) = '\' select @directory = @directory + @@servername
				else select @directory = @directory + '\' + @@servername

				if right(@directory,1) <> '\' set @directory = @directory + '\'
				--create backup directory folders
				if @mkdir = 'Y'
				begin
					select @exec_md =  'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,' ','') + ''', no_output'
					exec (@exec_md)
				end

				set @sql=@sql + 'disk = ''' + @directory + replace(@database,' ','') + '\' + replace(@database,' ','') + @file_name + ''''
			end

			Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database

			if @sequence > 1
				select @sql = @sql + ',' + char(13)
			else
			begin 
				if @withstats != '' 
					select @sql = @sql + ' with differential, stats=' + @withstats
				else
					select @sql = @sql + ' with differential'
					
				if @Compression = 'Y'
					select @sql = @sql + ', compression'
			end
			
			set @sequence  = @sequence - 1
		
		end

		--create backup directory folders
		if @execute = 'N'
		begin	
			select @sql as 'command to execute'
		end
		else
		begin
			--execute backup		
			exec (@sql)
			print @sql
		end
		
		--
 	
        set @sql = null

next_db:
fetch next from cur_db_backup into @database
end
close cur_db_backup
deallocate cur_db_backup
drop table #tblBkupLocation
end

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_checkdb]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Description	: 	Run DBCC Checkdb. This will automatically determine whether already dbcc is 
				is running or not. If running then it will stop with message
Created on	:	10/12/2006
Modified on	:	10/14/2006
Version		:	1.1
dependencies:
				Table							Procedure
				tbl_dba_maintenance_config		usp_tbl_dba_maintenance_u	
usage:
exec DBA..usp_tbl_dba_checkdb 	
		@database = 'DBA'--> 	Run CHECKDB on Individual Database (optional)
		,@check = 'N' 	--> 	'N' - do not perform CHECKDB for database in tbl_db_maintenance(default)
				--'Y' - check and run CHECKDB for database in tbl_db_maintenance				
		,@execute = 'Y' -->  	'N' - To see CHECKDB command without executing
				'Y' - Execute the CHECKDB command
		,@ScreenOutput = 'N' --> N - to transfer output in table (used in job)
note:
if [@check] = y this will run dbcc CHECKDB for all database with the [xcheckdb] 
column set to y in table DBA..tbl_dba_maintenance_config.
---------------------------------------------------------------------------------------------------------------------------------*/


CREATE         procedure [dbo].[usp_tbl_dba_checkdb] 
(
	@database sysname = NULL,
	@check char(1) = 'N',
	@execute char(1) = 'N',
	@ScreenOutput char(1) = 'Y'
) with encryption
as
set nocount on
declare @sql varchar(100)
if @database is not null
begin
	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
	begin
		raiserror('database %s is invalid or database status is not online',16,1,@database)
		goto check_tbl	
	end
	set @sql = 'use [' + @database + ']' + char(13)+ 'dbcc checkdb with NO_INFOMSGS'
		
	if @execute = 'Y'
	begin
		print ' '
		if @ScreenOutput = 'Y'
			select 'CHECKDB' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', + convert(varchar(20),getdate(),9) as 'Date_Time'
	    else
			print 'CHECKDB on ' + 	SUBSTRING(UPPER(@database),1,50) + ' at ' + convert(varchar(20),getdate(),9)
					
		--check if another DBCC process is running on same database
		if exists(select * from master..sysprocesses (nolock)where dbid = db_id(@database) and cmd like 'DBCC%')
			begin
				raiserror('Another DBCC process is already running on database %s',16,1,@database)
				return
			end
		
		exec (@sql)
		
	end
	else
	begin
		if @ScreenOutput = 'Y'
		begin
			select 'set @execute = ''Y'' ' as '**To Perform CHECKDB**'
			select 'CHECKDB' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', + convert(varchar(20),getdate(),9) as 'Date_Time'
			select @sql as 'command to execute'
		end
	end	
	--
	set @sql = null
end
if @database is null
 if @check = 'N'
 begin
	print ''	 
	print '
	setting parameter [@check]= ''Y'' will start CHECKDB on all database(s) in table DBA..tbl_dba_maintenance_config
	where column [xcheckdb] has value of ''Y''	'
	return
 end
check_tbl:
if @check = 'N'
return
	--update table tbl_dba_maintenance_config
exec DBA..usp_tbl_dba_maintenance_u
	--
	--display database in tbl_dba_maintenance_config set for CHECKDB
print ' '
	if @ScreenOutput = 'Y'
		select '***Database Flagged for CHECKDB in tbl_db_maintenance***' = [xdatabase] from DBA..tbl_dba_maintenance_config where [xcheckdb] <> 'N' and [xskip] <> 1
	--display message
if @execute = 'N'
 begin
     select 'set @execute = ''Y'' ' as '**To Perform CHECKDB**'
 end
--declare @sql varchar(100)
declare curuserdb cursor for
	select [xdatabase] 
	from DBA..tbl_dba_maintenance_config 
	where 
	[xcheckdb] <> 'N'
	and [xskip] <> 1
open curuserdb
fetch next from curuserdb into @database
while @@fetch_status = 0
begin
	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
    	begin
			if @ScreenOutput = 'Y'
	    		select 'checkdb error: ' + @database                 				

    		raiserror('database %s is not online',16,1,@database)
    		goto next_db	
    	end
    
	set @sql = 'use [' + @database + ']' + char(13)+ 'dbcc checkdb with NO_INFOMSGS'
    	if @execute = 'Y'
    	begin
	    	print ' '
		if @ScreenOutput = 'Y'
			select 'CHECKDB' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', + convert(varchar(20),getdate(),9) as 'Date_Time'
	    else
			print 'CHECKDB on ' + 	SUBSTRING(UPPER(@database),1,50) + ' at ' + convert(varchar(20),getdate(),9)

			--check if another DBCC process is running on same database
		if exists(select * from master..sysprocesses (nolock)where dbid = db_id(@database) and cmd like 'DBCC %')
			begin
				raiserror('Another DBCC process is already running on database %s',16,1,@database)
				return
			end
	        exec (@sql)
    	end
    	else
    	begin
		print ' '
			if @ScreenOutput = 'Y'
			begin
				select 'CHECKDB' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', + convert(varchar(20),getdate(),9) as 'Date_Time'
				select @sql as 'command to execute'
			end
    	end
next_db:
fetch next from curuserdb into @database
end 
close curuserdb
deallocate curuserdb



GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_updatestats]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*---------------------------------------------------------------------------------------------------
Purpose		: Run update statistics 
Created on	: 10/12/2006
Modified on	: 10/14/2006
Version		: 1.1
dependencies:
				Table							Procedure
				tbl_dba_maintenance_config		usp_tbl_dba_maintenance_u	

usage:
	exec DBA..usp_tbl_dba_updatestats
 		 @database = 'dba' --> optional
		,@table = 'tbl_dba_maintenance_config,tbl_Disk_Space' --> optional
		,@withsamplepercent = 'with sample 5 percent'--optional
		,@check = 'N' --> optional, default is 'N'
		,@execute = 'N' --> optional, default is 'N'
note:
if [@check] = y this will run update statistics for all database with the [xupdatestats] column
set to y in table DBA..tbl_dba_maintenance_config.
*/---------------------------------------------------------------------------------------------------


CREATE     procedure [dbo].[usp_tbl_dba_updatestats] 
(
	@database sysname = NULL,
	@table varchar(500) = NULL,
	@withsamplepercent varchar(25) = ' ',
	@check char(1) = 'N',
	@execute char(1) = 'N'
) with encryption
as
set nocount on

if @check <> 'Y'
 if @database is null
  begin
     print ''	 
     print 
'	the parameter [@check] must be set to ''Y'' in order to perform update statistics for database 
	in table [tbl_dba_maintenance_config] where column [updatestats] = ''Y''	'
     return
 end
declare  @table_list varchar(500)
	,@statement2  varchar(1000)
	,@statement3  varchar(250)
	,@sql_exec varchar(5000)
	
set @table_list = @table
 

set @statement2 = ' 
	print '' ''
	declare @tablename varchar(255)
	declare tablecursor cursor for
	select case TABLE_SCHEMA 
	when ''dbo'' then ''[''+ TABLE_NAME +'']''
	else ''['' + TABLE_SCHEMA + ''].['' + TABLE_NAME + '']''
	end 
	from INFORMATION_SCHEMA.TABLES
	where TABLE_TYPE = ''BASE TABLE''
	open tablecursor
	fetch next from tablecursor into @tablename
	while @@fetch_status = 0
	 begin 
	  if object_id('''' + @tablename + '''') is null
	  begin
		print ''***invalid table name: '' + @tablename
		goto next_tbl
	  end
	  print  @tablename 
	  exec(''update statistics '' + @tablename + '' ' 
set @statement3 = ''') 
next_tbl:
	fetch next from tablecursor into @tablename
	end
	close tablecursor
	deallocate tablecursor'

		--if @database & @table is not null, update statistics for the table(s) specified

if @database is not null
 if @table_list is not null
 begin
	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
	begin
		select 'update statistics error: ' + @database                   				
	   	raiserror('database %s is invalid or database status is not ONLINE',16,1,@database)
	        goto check_tbl	
	end
	
	declare @table_update varchar(500),@string_len int, @tablename varchar(100), @find_semi int, @loop char(1)
	select @string_len = len(@table_list), @loop = 'N'

	print ' '
	select 'UPDATE STATISTICS' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
	+ convert(varchar(20),getdate(),9) as 'Date_Time', + @withsamplepercent as 'SCAN OPTION'

	
	if upper(@execute) <> 'Y'
	begin
		select 'set @execute = ''Y'' ' as '**To Perform REINDEX**'
		goto check_tbl
	end	

	select @table_update = replace(@table_list,',',';')
		
        while @table_update is not null
        begin
  	 select @find_semi = patindex ('%;%',@table_update)
	
	 if @find_semi <> 0	  
         begin
  	   	select @tablename = ltrim(rtrim(substring(@table_update,1,(@find_semi - 1))))

	/*---------------------------------------------------------------------------------------------------------------------	
	       -- check if table name is valid before reindexing 
	       -- if not valid, print an error & continue to next table
	  ---------------------------------------------------------------------------------------------------------------------*/		

	        exec (
	   	'if exists(select 1 from ' + @database + '..sysobjects where type = ''u'' and name = ''' + @tablename + ''')
 	     		begin
		      		declare @cmd varchar(255)
		    		select @cmd = ''update statistics ' + @database + '..' + @tablename + ' ' + @withsamplepercent + '''
		    		print + ' + '''' + @tablename + ''' + char(13)+ char(10)
		    		exec (@cmd)
	    		end
	   		else
	    		begin
 	    		    	print ''***invalid table name: '' + ' + '''' + @tablename+ '''+ char(13) + char(10)
	    		    	print '' '' 
	   		end'	)

  	   	select @table_update = ltrim(substring(@table_update,(@find_semi + 1),@string_len))
		
		select @loop = 'Y'
	  	continue
	  
         end
	 else
	 begin
	  	if @loop = 'Y'
	   	begin
	    		select @tablename = @table_update
	   	end
	  	else
	   	begin
	    		select @tablename = @table_list
	    		print getdate() 
	   	end
	 	
		if @tablename <> ' '
	  	begin
			exec 	(
	    		'if exists(select 1 from ' + @database + '..sysobjects where type = ''u'' and name = ''' + @tablename + ''')
 	     		 begin
	      			declare @cmd varchar(100)
	    			select @cmd = ''update statistics ' + @database + '..' + @tablename + ' ' + @withsamplepercent +'''
	    			print + ' + '''' + @tablename + ''' + char(13)
	    			exec (@cmd)
	    		 end
	   		 else
	    		 begin
 	    			print ''***invalid table name: '' + ' + '''' + @tablename+ '''+ char(13)
	    			print '' '' 
	   		 end'	)
	  	end
	 	select @table_update = null
	 end
        end
 end
 else 
 begin
  	print ' '
	select 'UPDATE STATISTICS' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
	+ convert(varchar(20),getdate(),9) as 'Date_Time', + @withsamplepercent as 'SCAN OPTION'

   	
	select @sql_exec = 
	'	set arithabort on' + char(13) +
	'	set quoted_identifier on' + char(13) +
	'	use [' + rtrim(@database) +	']' + char(13) + 
		@statement2 + @withsamplepercent + @statement3 

   	if upper(@execute) <> 'N'
	begin
		exec (@sql_exec)
	end		
	else
	begin
	 	select (@sql_exec)
	end
 end

	--quit if @check = 'n', else continue 
check_tbl:
if @check = 'N'
return
	--update table tbl_dba_maintenance_config
exec DBA..usp_tbl_dba_maintenance_u

	--display database in tbl_dba_maintenance_config set for reindex
print ' '
select '***Database Flagged for UPDATE STATISTICS in tbl_db_maintenance***' = [xdatabase] from DBA..tbl_dba_maintenance_config
where [xupdatestats] <> 'N' and [xskip] <> 1

	--display message
if upper(@execute) = 'N'
begin
	select 'set @execute = ''Y'' ' as '**To Perform Reindex**'
end

--reindex all table(s) in tbl_db_maintenance
declare cur_db_updatestats cursor for
	select [xdatabase],[withsamplepercent]
	from DBA..tbl_dba_maintenance_config
	where [xupdatestats] = 'Y'
	and [xskip] <> 1

open cur_db_updatestats
fetch next from cur_db_updatestats into @database, @withsamplepercent
while @@fetch_status = 0
begin
	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
	begin
		select 'update statistics error for: ' + @database                 				
	   	raiserror('database %s is not ONLINE',16,1,@database)
	        goto next_db	
	end	
	
	print ' '
	select 'UPDATE STATISTICS' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
	+ convert(varchar(20),getdate(),9) as 'Date_Time', + @withsamplepercent as 'SCAN OPTION'

  	select @sql_exec = 
	'	set arithabort on' + char(13) +
	'	set quoted_identifier on' + char(13) +
	'	use [' + rtrim(@database) +	']' + char(13) + 
		@statement2 + @withsamplepercent + @statement3 
	
	if upper(@execute) = 'Y'
	begin
		exec (@sql_exec)
	end
	else
	begin
	   	select @sql_exec as 'command to execute'
	end

	
	
next_db:	
fetch next from cur_db_updatestats into @database,@withsamplepercent
end

close cur_db_updatestats
deallocate cur_db_updatestats



GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_updateusage]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: Run dbcc updateusage & sp_spaceused @updateuse = true to correct unallocated space
Created on	: 10/14/2006
Modified on	: 10/14/2006
Version		: 1.1
dependencies:
				Table							Procedure
				tbl_dba_maintenance_config		usp_tbl_dba_maintenance_u	
usage:
exec DBA..usp_tbl_dba_updateusage 
		 @database = 'dba' 	--> 	Run UPDATEUSAGE on Individual Database (optional)
		,@check = 'Y' 		--> 	'N' - do not perform UPDATEUSAGE for database in tbl_db_maintenance(default)
				   		--'Y' - check and run UPDATEUSAGE for database in tbl_db_maintenance				
		,@execute = 'N' 	-->  	'N' - To see backup command without executing
				      		'Y' - Execute the UPDATEUSAGE command
note:
if [@check] = y, this will run update usage for all database with the [xupdateusage] column
set to y in table DBA..tbl_dba_maintenance_config.
------------------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE   procedure [dbo].[usp_tbl_dba_updateusage] 
(
	@database sysname = null,
	@execute char(1) = 'N',
	@check char(1) = 'N'

) with encryption
as
set nocount on
if @database is null
 if @check = 'N'
 begin
     print ''	 
     print '
	setting parameter [@check]= ''Y'' will start UPDATEUSAGE on all database(s) in table DBA..tbl_dba_maintenance_config
	where column [xupdateusage] has value of ''Y''	'
 return
 end
declare @sql varchar(255)
if @database is not null
begin
	
	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
		begin
		select 'checkdb error: ' + @database                   				
		raiserror('database %s is invalid or database status is not online',16,1,@database)
		goto check_tbl	
	end
     	if @execute = 'Y'
     	begin
		
		select 'UPDATEUSAGE' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', + convert(varchar(20),getdate(),9) as 'Date_Time'
	     	set @sql = ('use [' + @database + ']' + char(13) + 'dbcc updateusage (0) with no_infomsgs ' 
			+ char(13) + 'exec sp_spaceused @updateusage = true')
		exec (@sql)
     	end
     	else
     	begin
		select 'set @execute = ''Y'' ' as '**To Perform UPDATEUSAGE**'
		select 'use [' + @database + ']' + char(13) + 'dbcc updateusage (0) with no_infomsgs ' 
		+ char(13) + 'exec sp_spaceused @updateusage = true' as 'command to execute'
     	end	
end
check_tbl:
if @check <> 'Y'
return
	--update table tbl_dba_maintenance_config
	exec DBA..usp_tbl_dba_maintenance_u

	--display database in tbl_dba_maintenance_config set for backup
print ' '
select '***Database Flagged for UPDATEUSAGE in tbl_db_maintenance***' = [xdatabase]from DBA..tbl_dba_maintenance_config
where [xupdateusage] <> 'N' and [xskip] <> 1
	--display message
if @execute = 'N'
begin
	select 'set @execute = ''Y'' ' as '**To Perform UPDATEUSAGE**'
end
declare curuserdb cursor for
	select [xdatabase]
	from DBA..tbl_dba_maintenance_config
	where [xupdateusage] <> 'N'
	and [xskip] <> 1
open curuserdb
fetch next from curuserdb into @database
while @@fetch_status = 0
begin
	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
	begin
		select 'updateusage error: ' + @database                 				
		raiserror('database %s is not online',16,1,@database)
		goto next_db	
	end	
    	select 'UPDATEUSAGE' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', + convert(varchar(20),getdate(),9) as 'Date_Time'
   	set @sql = 'use [' + @database + ']' + char(13) + 'dbcc updateusage (0) with no_infomsgs ' 
		+ char(13) + 'exec sp_spaceused @updateusage = true'
    	if @execute = 'Y'
    	begin
    		
		exec (@sql)
    	end
    	else
    	begin
    		select @sql as 'command to execute'
   	 end
    
next_db:
fetch next from curuserdb into @database
end
close curuserdb
deallocate curuserdb




GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_reindex]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*---------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: 	Run dbcc dbreindex for database  
Created on	:	10/14/2006
Modified on	: 	10/14/2006
Version		:	1.1
dependencies:
				Table							Procedure
				tbl_dba_maintenance_config		usp_tbl_dba_maintenance_u	
usage:
exec DBA..usp_tbl_dba_reindex
		 @database = 'dba' 					--> 	REINDEX Individual Database (optional)
		,@table = 'tbl_dba_maintenance_config,tbl_dba_maint_file_location' 		--> 	REINDEX only specified tables in database '@database' (optional)
		,@check = 'Y' 						--> 	'N' - do not REINDEX database in tbl_db_maintenance(default)
				   					--	'Y' - check and run REINDEX in tbl_db_maintenance				
		,@execute = 'y' 					-->  	'N' - To see REINDEX command without executing
				      						'Y' - Execute REINDEX command
note:
if [@check] = y this will run dbcc dbreindex for all database with the [xreindex] column
set to y in table DBA..tbl_dba_maintenance_config.
 Arithabort error has already been handled
*/----------------------------------------------------------------------------------------------------------------------------------------------

--usp_tbl_dba_reindex @check='Y',@execute='Y'



CREATE          procedure [dbo].[usp_tbl_dba_reindex]
(
	@database sysname = NULL,
	@table varchar(100) = NULL,
	@check char(1) = 'N',
	@execute char(1) = 'N'
) with encryption
as
set nocount on
if @database is null
 if @check = 'N'
 begin
     print ''	 
     print '
	setting parameter [@check]= ''Y'' will start DBREINDEX on all database(s) in table DBA..tbl_dba_maintenance_config
	where column [xreindex] has value of ''Y''	'
     return
 end
declare  @table_list varchar(500)
	,@statement1  varchar(1000)
	,@sql_exec varchar(1000)
		
set @table_list = @table 
set @statement1 = '
	declare @tablename varchar(255)
	declare tablecursor cursor for
	select case TABLE_SCHEMA 
	when ''dbo'' then ''[''+ TABLE_NAME +'']''
	else ''['' + TABLE_SCHEMA + ''].['' + TABLE_NAME + '']''
	end 
	from INFORMATION_SCHEMA.TABLES
	where TABLE_TYPE = ''BASE TABLE''
	and TABLE_NAME != ''tbl_dba_maintenance_config''
	open tablecursor
	fetch next from tablecursor into @tablename
	while @@fetch_status = 0
	 begin 
	  print ''TableName -- '' + @tablename
	  exec (''dbcc dbreindex('''''' + @tablename + '''''','''''''', 0) WITH NO_INFOMSGS '')
	fetch next from tablecursor into @tablename
	end
	close tablecursor
	deallocate tablecursor'
	--if @database & specific @table is specified, reindex only those table(s) 
if @database is not null
 if @table_list is not null
 begin
	
	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
	begin
	select 'dbreindex error: ' + @database                   				
   	raiserror('database %s is invalid or database status is not online',16,1,@database)
        goto check_tbl	
	end
	
	declare @table_update varchar(500),@string_len int, @tablename varchar(100), @find_semi int, @loop char(1)
	select @string_len = len(@table_list), @loop = 'n'
	
	select 'REINDEX' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
	+ convert(varchar(20),getdate(),9) as 'Date_Time'
	if @execute <> 'Y'
     	begin
	    select 'set @execute = ''Y'' ' as '**To Perform REINDEX**'
	    goto check_tbl
     	end		
	select @table_update = replace(@table_list,',',';')
		
        while @table_update is not null
        begin
  	 select @find_semi = patindex ('%;%',@table_update)
	
	 if @find_semi <> 0	  
         begin
  	   	select @tablename = rtrim(substring(@table_update,1,(@find_semi - 1)))
	/*---------------------------------------------------------------------------------------------------------------------	
	       -- check if table name is valid before reindexing 
	       -- if not valid, print an error & continue to next table
	  ---------------------------------------------------------------------------------------------------------------------*/		
									
	        	exec (
	   		'if exists(select 1 from ' + @database + '..sysobjects where type = ''u'' and name = ''' + @tablename + ''')
 	     		 begin
	      			declare @cmd varchar(100)
	    			select @cmd = ''dbcc dbreindex ([' + @database + '..' + @tablename +	'], '''''''', 0) WITH NO_INFOMSGS''
	    			print ''TableName -- ''+ ' + '''' + @tablename + ''' + char(13)
	    			exec (@cmd)
	    		end
	   		else
	    		begin
 	    			print ''***Invalid Table Name: '' + ' + '''' + @tablename+ '''+ char(13)
	    			print '' '' 
	    		end'	)
  	   	select @table_update = ltrim(substring(@table_update,(@find_semi + 1),@string_len))
		
		select @loop = 'Y'
	  	continue
	  
         end
	 else
	 begin
	  	if @loop = 'Y'
	   	begin
	    		select @tablename = @table_update
	   	end
	  	else
	   	begin
	    		select @tablename = @table_list
	    		 
	   	end
	 	
		if @tablename <> ' '
	  	begin
			exec (
	   		'if exists(select 1 from ' + @database + '..sysobjects where type = ''u'' and name = ''' + @tablename + ''')
 	     		 begin
	      			declare @cmd varchar(100)
	    			select @cmd = ''dbcc dbreindex ([' + @database + '..' + @tablename +	'], '''''''', 0) WITH NO_INFOMSGS''
	    			print ''TableName -- ''+ ' + '''' + @tablename + ''' + char(13)
	    			exec (@cmd)
	    		end
	   		else
	    		begin
 	    			print ''***invalid table name: '' + ' + '''' + @tablename+ '''+ char(13)
	    			print '' '' 
	   			
	    		end'	)
	  	end
	 	select @table_update = null
	 end
        end
 end
 else	--if @database is provided & @table is not - reindex all tables in the database
 begin
  	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
	begin
		select 'reindex error: ' + @database                   				
   	    	raiserror('database %s is invalid or database status is not online',16,1,@database)
        	goto check_tbl	
	end
	
	select 'REINDEX' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
	+ convert(varchar(20),getdate(),9) as 'Date_Time'
   	select @sql_exec = 'use ' + rtrim(@database) +	char(13) + char(10) + @statement1 
   	exec (@sql_exec)	
 end
check_tbl:
if @check = 'N'
return
	--update table tbl_dba_maintenance_config
exec DBA..usp_tbl_dba_maintenance_u

	--display database in tbl_dba_maintenance_config set for reindex
print ' '
select '***Database Flagged for REINDEX in tbl_db_maintenance***' = [xdatabase] from DBA..tbl_dba_maintenance_config
where [xreindex] <> 'N' and [xskip] <> 1
	--display message
if @execute = 'N'
 begin
 	select 'set @execute = ''Y'' ' as '**To Perform Reindex**'
     	return
 end
	--reindex all table(s) in tbl_dba_maintenance_config (default option) 
declare cur_db_reindex cursor for
	select 	[xdatabase]
	from 	DBA..tbl_dba_maintenance_config
	where 	[xreindex] <> 'N'
	and 	[xskip] <> 1
open cur_db_reindex
fetch next from cur_db_reindex into @database
while @@fetch_status = 0
begin
	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
	begin
	    	select 'reindex error for: ' + @database                 				
   	    	raiserror('database %s is not online',16,1,@database)
            	goto next_db	
	end
	
	select ' '
	select 'REINDEX' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
	+ convert(varchar(20),getdate(),9) as 'Date_Time'
	
	if @execute = 'Y'
    	begin	
		select ''
		select @sql_exec = 	
		'	set arithabort on' + char(13) +
		'	set quoted_identifier on' + char(13) +
--		'	print ''Database : ' + @database + ' started...''' + char(13) +
		'	use [' + rtrim(@database) + ']' + char(13) + 
			@statement1 
	 	exec 	(@sql_exec)
		--print @sql_exec
		
	end
    	else
    	begin
	    	select @sql_exec  as 'command to execute'
    	end	
next_db:	
fetch next from cur_db_reindex into @database
end
close cur_db_reindex
deallocate cur_db_reindex




GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_AlterIndex]    Script Date: 09/21/2007 19:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*---------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: 	Run Alter Index   
Created on	:	03/09/2007
Modified on	: 	03/09/2007
Version		:	1.1
dependencies:
				Table							Procedure
				tbl_dba_maintenance_config		usp_tbl_dba_maintenance_u	
usage:
exec DBA..usp_tbl_dba_AlterIndex
		 @database = 'dba' 					--> 	REINDEX Individual Database (optional)
		,@check = 'Y' 						--> 	'N' - do not ALTER INDEX database in tbl_db_maintenance(default)
				   					--	'Y' - check and run ALTER INDEX in tbl_db_maintenance				
		,@execute = 'y' 					-->  	'N' - To see AlterIndex command without executing
				      						'Y' - Execute AlterIndex command
note:
if [@check] = y this will run Alter Index for all database with the [xAlterIndex] column
set to y in table DBA..tbl_dba_maintenance_config.
 
*/----------------------------------------------------------------------------------------------------------------------------------------------

--usp_tbl_dba_AlterIndex @check='Y',@execute='Y'

CREATE proc [dbo].[usp_tbl_dba_AlterIndex] 
(
	@database sysname = NULL,
	@check char(1) = 'N',
	@execute char(1) = 'N'
) with encryption
as 
begin
	SET NOCOUNT ON
	DECLARE @runStatus int, @strQuery varchar(250), @objectid int, @indexid int,
			@partitioncount bigint, @schemaname nvarchar(130), @objectname nvarchar(130),
			@indexname nvarchar(130), @partitionnum bigint, @partitions bigint, @frag float,
			@command varchar(8000), @fragLimit int, @fragRebuild int, @dblist varchar(max),
			@dbid int, @ignore_dup_key bit
-- Conditionally select tables and indexes from the sys.dm_db_index_physical_stats function 

	create table #tblObjectInfo
	(
		objectname nvarchar(130),
		schemaname nvarchar(130)
	)

	create table #tblIndexInfo
	(
		indexname nvarchar(130),
		ignore_dup_key	bit
	)

	create table #tblPartitionInfo
	(
		partcount bigint
	)	

if @database is not null
begin
	if @check = 'Y'
	begin
		 print ''	 
		 print 'setting parameter [@check]= ''Y'' will start Alter Index on all database(s) in table DBA..tbl_dba_maintenance_config
			where column [xAlterIndex] has value of ''Y''	'
		return
	end
		
	if (select db_id(@database)) > 0
	begin
		select @dbid = db_id(@database)

		select 'Alter Index Started on ' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
		+ convert(varchar(20),getdate(),9) as 'Date_Time'

		select @fragLimit = xFragLimit, @fragRebuild =  xFragRebuild
			from DBA..tbl_dba_maintenance_config
			where xdatabase = @database
		SELECT
			object_id AS objectid,
			index_id AS indexid,
			partition_number AS partitionnum,
			avg_fragmentation_in_percent AS frag
		INTO #work_to_do
		FROM sys.dm_db_index_physical_stats (@dbid, NULL, NULL , NULL, 'LIMITED')
		WHERE avg_fragmentation_in_percent > @fragLimit AND index_id > 0

		-- Declare the cursor for the list of partitions to be processed.
		DECLARE partitions CURSOR FOR SELECT * FROM #work_to_do
		-- Open the cursor.

		OPEN partitions
		fetch partitions into @objectid, @indexid, @partitionnum, @frag
		-- Loop through the partitions.
		set @runStatus = 0

		WHILE (@@fetch_status = 0)
		BEGIN
			set @runStatus = 1

			truncate table #tblObjectInfo
			
			select @strQuery = ' use [' + @database + '] SELECT QUOTENAME(o.name), QUOTENAME(s.name)
			FROM sys.objects AS o
			JOIN sys.schemas as s ON s.schema_id = o.schema_id
			WHERE o.object_id =' + convert(varchar,@objectid)

			insert into #tblObjectInfo exec (@strQuery)

			truncate table #tblIndexInfo
			select @strQuery = ' use [' + @database + '] SELECT QUOTENAME(name), ignore_dup_key
			FROM sys.indexes
			WHERE  object_id = ' + convert(varchar,@objectid) + ' AND index_id = ' + convert(varchar,@indexid)
			insert into #tblIndexInfo exec (@strQuery)
			

			truncate table #tblPartitionInfo
			select @strQuery = ' use [' + @database + '] SELECT count (1)
			FROM sys.partitions
			WHERE  object_id = ' + convert(varchar,@objectid) + ' AND index_id = ' + convert(varchar,@indexid)

			insert into #tblPartitionInfo exec (@strQuery)

			select @objectname = objectname, @schemaname = schemaname from #tblObjectInfo

			select @indexname = indexname, @ignore_dup_key = ignore_dup_key from #tblIndexInfo

			select @partitioncount = partcount from #tblPartitionInfo

			IF @frag < @fragRebuild
			begin

				SET @command = 'use [' + @database + '] ALTER INDEX ' + @indexname + ' ON ' + @schemaname + '.' + @objectname + ' SET (ALLOW_PAGE_LOCKS = ON)'
				exec(@command)
				SET @command = 'use [' + @database + '] ALTER INDEX ' + @indexname + ' ON ' + @schemaname + '.' + @objectname + ' REORGANIZE'

			end

			IF @frag >= @fragRebuild
			begin
				SET @command = 'use [' + @database + '] ALTER INDEX ' + @indexname + ' ON ' + @schemaname + '.' + @objectname + ' REBUILD'

				if @ignore_dup_key = 1
					SET @command = @command + ' WITH (IGNORE_DUP_KEY = ON)'
			end

			IF @partitioncount > 1
				SET @command = @command + ' PARTITION=' + CAST(@partitionnum AS varchar(10))


			if @execute = 'Y'
			begin

				select 'Executed : ' +  @command + ' At ' + convert(varchar(20),getdate(),9)
				EXEC (@command)
				select 'Finished at ' + convert(varchar(20),getdate(),9)

			end
			else
				select @command 'Command To Execute'


			fetch partitions into @objectid, @indexid, @partitionnum, @frag

		END
		-- Close and deallocate the cursor.
		CLOSE partitions
		DEALLOCATE partitions
		-- Drop the temporary table.
		if @runStatus = 1
			select 'Alter Index Completed on ' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
			+ convert(varchar(20),getdate(),9) as 'Date_Time'
		else
			select 'avg_fragmentation_in_percent is less than ' + convert(varchar,@fragLimit) as 'Alter Index Not Applicable'

		DROP TABLE #work_to_do
	end
end
else if (@check = 'Y')
begin

	exec DBA..usp_tbl_dba_maintenance_u
	declare cur_db_index cursor for
		select 	[xdatabase]
		from 	DBA..tbl_dba_maintenance_config
		where 	[xAlterIndex] <> 'N'
		and 	[xskip] <> 1

	open cur_db_index
	fetch cur_db_index into @database
	set @dblist = ''
	while (@@fetch_status = 0)
	begin
		
		set @dblist = @dblist + @database + ','

		fetch cur_db_index into @database

	end
	close cur_db_index
	deallocate cur_db_index

	while len(@dblist) > 0 
	begin

		set @database = left(@dblist,charindex(',',@dblist,1) - 1)
		set @dblist = right(@dblist,len(@dblist) - (len(@database) + 1))

		select 'Alter Index Started on ' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
		+ convert(varchar(20),getdate(),9) as 'Date_Time'
	
		select @dbid = db_id(@database)

		select @fragLimit = xFragLimit, @fragRebuild =  xFragRebuild
			from DBA..tbl_dba_maintenance_config
			where xdatabase = @database

		SELECT
			object_id AS objectid,
			index_id AS indexid,
			partition_number AS partitionnum,
			avg_fragmentation_in_percent AS frag
		INTO #work_to_do1
		FROM sys.dm_db_index_physical_stats (@dbid, NULL, NULL , NULL, 'LIMITED')
		WHERE avg_fragmentation_in_percent > @fragLimit AND index_id > 0

		-- Declare the cursor for the list of partitions to be processed.
		DECLARE partitions1 CURSOR FOR SELECT * FROM #work_to_do1
		-- Open the cursor.
		OPEN partitions1
		fetch partitions1 into @objectid, @indexid, @partitionnum, @frag
		-- Loop through the partitions.
		set @runStatus = 0

		WHILE (@@fetch_status = 0)
		BEGIN
			set @runStatus = 1

			truncate table #tblObjectInfo
			
			select @strQuery = ' use [' + @database + '] SELECT QUOTENAME(o.name), QUOTENAME(s.name)
			FROM sys.objects AS o
			JOIN sys.schemas as s ON s.schema_id = o.schema_id
			WHERE o.object_id =' + convert(varchar,@objectid)
			
			insert into #tblObjectInfo exec (@strQuery)


			truncate table #tblIndexInfo
			select @strQuery = ' use [' + @database + '] SELECT QUOTENAME(name), ignore_dup_key
			FROM sys.indexes
			WHERE  object_id = ' + convert(varchar,@objectid) + ' AND index_id = ' + convert(varchar,@indexid)
			insert into #tblIndexInfo exec (@strQuery)

			truncate table #tblPartitionInfo
			select @strQuery = ' use [' + @database + '] SELECT count (1)
			FROM sys.partitions
			WHERE  object_id = ' + convert(varchar,@objectid) + ' AND index_id = ' + convert(varchar,@indexid)

			insert into #tblPartitionInfo exec (@strQuery)

			select @objectname = objectname, @schemaname = schemaname from #tblObjectInfo

			select @indexname = indexname, @ignore_dup_key = ignore_dup_key from #tblIndexInfo

			select @partitioncount = partcount from #tblPartitionInfo
			
			IF @frag < @fragRebuild
			begin

				SET @command = 'use [' + @database + '] ALTER INDEX ' + @indexname + ' ON ' + @schemaname + '.' + @objectname + ' SET (ALLOW_PAGE_LOCKS = ON)'
				exec(@command)
				SET @command = 'use [' + @database + '] ALTER INDEX ' + @indexname + ' ON ' + @schemaname + '.' + @objectname + ' REORGANIZE'

			end

			IF @frag >= @fragRebuild
			begin
				SET @command = 'use [' + @database + '] ALTER INDEX ' + @indexname + ' ON ' + @schemaname + '.' + @objectname + ' REBUILD'

				if @ignore_dup_key = 1
					SET @command = @command + ' WITH (IGNORE_DUP_KEY = ON)'
			end


			IF @partitioncount > 1
				SET @command = @command + ' PARTITION=' + CAST(@partitionnum AS varchar(10))

			if @execute = 'Y'
			begin

				select 'Executed : ' +  @command + ' At ' + convert(varchar(20),getdate(),9)
				EXEC (@command)
				select 'Finished at ' + convert(varchar(20),getdate(),9)

			end
			else
				select @command 'Command To Execute'


			fetch partitions1 into @objectid, @indexid, @partitionnum, @frag

		END
		if @runStatus = 1
			select 'Alter Index Completed on ' as 'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as 'Target_Database', 
			+ convert(varchar(20),getdate(),9) as 'Date_Time'
		else
			select 'avg_fragmentation_in_percent is less than ' + convert(varchar,@fragLimit) as 'Alter Index Not Applicable'
		
		-- Close and deallocate the cursor.
		CLOSE partitions1
		DEALLOCATE partitions1
		-- Drop the temporary table.
		DROP TABLE #work_to_do1
	end
end

drop table #tblObjectInfo
drop table #tblIndexInfo
drop table #tblPartitionInfo

end
GO
/****** Object:  StoredProcedure [dbo].[usp_dba_CheckLogSpace]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: 	Check log space and execute log backup if necessary and applicable
Created on	:	12/12/2006
Modified on	: 	12/12/2006
Version		:	1.1
dependencies	:	Table						Procedure
				tbl_dba_maintenance_config	usp_tbl_dba_log_backup
											usp_tbl_dba_maintenance_u
Usage		: 	Not Specfifc
***********************************************************************/
create PROCEDURE [dbo].[usp_dba_CheckLogSpace] with encryption
as
begin
SET NOCOUNT ON

	exec DBA..usp_tbl_dba_maintenance_u

	DECLARE @dbname sysname, @UsedSpace float, @Subject varchar(100), @FileName varchar(100)
	create table #tblLogSpace
	(
		xdatabase		sysname,
		LogSize			float,
		LogSpace_Used	float,
		Status			float
	)
	insert into #tblLogSpace
		exec(N'dbcc sqlperf(logspace)')
	declare curLogSpace cursor for 
						select	xdatabase, LogSpace_Used 
						from	#tblLogSpace
	
	open curLogSpace

	fetch curLogSpace into @dbname, @UsedSpace
	while @@fetch_status = 0
	begin
--		print @UsedSpace
		if @UsedSpace>(select xLogSpaceLimit from DBA..tbl_dba_maintenance_config where upper(xdatabase) = upper(@dbname))
		begin
			if exists(select 1 from DBA..tbl_dba_maintenance_config where upper(xdatabase) = upper(@dbname) and xlog = N'Y')
			begin

				--Cheking if the database is primary logshipping, if yes then call the logshipping backup job
				if (DBA.dbo.ufn_dba_IsLogShippingDatabase(@dbname) = N'Y')
				begin
						print N'executed logshipping backup for [' + @dbname + N']'
					exec DBA.dbo.usp_dba_CallLogShippingBackupJob @database = @dbname, @execute = N'Y'
				end
				else
				begin
						print N'executed trans log backup for [' + @dbname + N']'
					exec DBA..usp_tbl_dba_log_backup @database = @dbname, @execute = N'Y'	
				end
				select top 1 @FileName  = ltrim(rtrim(name)) from master..sysaltfiles where db_name(dbid)= @dbname and upper(filename) like N'%.LDF%'
				exec (N'use [' + @dbname + N'] dbcc shrinkfile([' + @FileName  + N'],truncateonly)')
			end
			else
			begin
					if upper(@dbname) = N'TEMPDB'
					begin
							print N'executed shrinkdatabase for TEMPDB'
							dbcc shrinkdatabase(@dbname,0,truncateonly)
					end
					else
					begin
						if (databasepropertyex(@dbname,N'recovery') = N'SIMPLE')
						begin
							declare @SQLServerVersion smallint;
							select @SQLServerVersion = DBA.dbo.ufn_dba_getMajorVersion();

							if @SQLServerVersion = 2000
								exec (N'backup log ' + @dbname + N' with no_log');

							select top 1 @FileName  = ltrim(rtrim(name))
								from master..sysaltfiles 
								where db_name(dbid)= @dbname 
										and upper(filename) like N'%.LDF%'
								order by fileid 

							exec (N'use [' + @dbname + N'] dbcc shrinkfile([' + @FileName  + N'],truncateonly)')
					
						end
						else
						begin
							--Cheking if the database is primary logshipping, if yes then call the logshipping backup job
							if (DBA.dbo.ufn_dba_IsLogShippingDatabase(@dbname) = N'Y')
							begin
								print N'executed logshipping backup for [' + @dbname + N']'
								exec DBA.dbo.usp_dba_CallLogShippingBackupJob @database = @dbname, @execute = N'Y'
							end
							else
							begin
								print N'executed trans log backup for [' + @dbname + N']'
								exec DBA..usp_tbl_dba_log_backup @database = @dbname, @execute = N'Y'
							end

							select top 1 @FileName  = ltrim(rtrim(name)) from master..sysaltfiles where db_name(dbid)= @dbname and upper(filename) like N'%.LDF%'
							exec (N'use [' + @dbname + N'] dbcc shrinkfile([' + @FileName + N'],truncateonly)')

						end
					end
			end
		end
		fetch curLogSpace into @dbname, @UsedSpace
	end

	CLOSE curLogSpace
	DEALLOCATE curLogSpace

	drop table #tblLogSpace
end

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_Start_FullBackup]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: 	Call FULL backup procedure based on configuration 
Created on	:	2/21/2007
Modified on	: 	2/21/2007
Version		:	1.1
dependencies	: Table					Procedure
		  tbl_dba_maintenance_config			usp_tbl_dba_maintenance_u
		  tbl_dba_BackupPlan
Usage: 

exec DBA..[usp_tbl_dba_Start_FullBackup]		
--------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE procedure [dbo].[usp_tbl_dba_Start_FullBackup] with encryption
as

	declare @database	varchar(100),
		@Sequence	int,
		@NumWeek	int
	-- update current status for every database
	exec usp_tbl_dba_maintenance_u
	
	-- Run all backup that does not have multi backup plan
	exec usp_tbl_dba_full_backup @check='Y', @execute='Y'
	-- ***********************************************

	-- Process Weekly Schedule
	print 'Starting Weekly backup process......'

	select @NumWeek  = (datepart(ww,getdate())) + 1 - datepart(ww,dateadd(dd,-datepart(dd,getdate()),getdate()))
	
	declare curFB cursor for select xdatabase
				 from DBA..tbl_dba_BackupPlan
				 where xDaily = 'N' and xBkupType = 'FULL'
				 and charindex(convert(char(1),@NumWeek),xWeekly,1) > 0
				 and xWDayName = datename(dw,getdate())
				 order by xdatabase
	
	open curFB
	fetch curFB into @database

	while @@fetch_status = 0
	begin

		exec usp_tbl_dba_full_backup @database = @database, @execute='Y'	

		fetch curFB into @database

	end
	close curFB
	deallocate curFB
	print 'Weekly backup process completed.....'
	-- Weekly Schedule processing over
	-- Process Monthly Schedule

	print 'Starting Monthly backup process......'

	declare curFB cursor for select xdatabase
				 from DBA..tbl_dba_BackupPlan
				 where xDaily = 'N' and xBkupType = 'FULL'
				 and (charindex(convert(char(1),@NumWeek),xWeekly,1) = 0 or xWDayName <> xMDayName)
				 and xMonthly = 'Y' and xWOfMonth = @NumWeek
				 and xMDayName = datename(dw,getdate())
				 order by xdatabase
	
	open curFB
	fetch curFB into @database

	while @@fetch_status = 0
	begin

		exec usp_tbl_dba_full_backup @database = @database, @execute='Y'	

		fetch curFB into @database

	end
	close curFB
	deallocate curFB

	print 'Monthly backup process completed.....'
	-- Monthly Schedule processing over


GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_dba_Start_DiffBackup]    Script Date: 09/20/2007 18:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: 	Call DIFF backup procedure based on configuration 
Created on	:	2/21/2007
Modified on	: 	2/21/2007
Version		:	1.1
dependencies	: Table					Procedure
		  tbl_dba_maintenance_config			usp_tbl_dba_maintenance_u
		  tbl_dba_BackupPlan
Usage: 

exec DBA..[usp_tbl_dba_Start_FullBackup]		
--------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE procedure [dbo].[usp_tbl_dba_Start_DiffBackup] with encryption
as

	declare @database	varchar(100),
		@FileGroup 	varchar(100), 
		@Sequence	int,
		@NumWeek	int
	-- update current status for every database
	exec usp_tbl_dba_maintenance_u
	
	-- Run all backup that does not multi backup plan
	exec usp_tbl_dba_diff_backup @check='Y', @execute='Y'
	-- ***********************************************

	-- Process Weekly Schedule
	print 'Starting Weekly backup process......'

	select @NumWeek  = (datepart(ww,getdate())) + 1 - datepart(ww,dateadd(dd,-datepart(dd,getdate()),getdate()))
	
	declare curFB cursor for select xdatabase
				 from DBA..tbl_dba_BackupPlan
				 where xDaily = 'N' and xBkupType = 'DIFF'
				 and charindex(convert(char(1),@NumWeek),xWeekly,1) > 0
				 and xWDayName = datename(dw,getdate())
				 order by xdatabase
	
	open curFB
	fetch curFB into @database

	while @@fetch_status = 0
	begin

		exec usp_tbl_dba_diff_backup @database = @database, @execute='Y'	

		fetch curFB into @database

	end
	close curFB
	deallocate curFB
	print 'Weekly backup process completed.....'
	-- Weekly Schedule processing over
	-- Process Monthly Schedule

	print 'Starting Monthly backup process......'

	declare curFB cursor for select xdatabase
				 from DBA..tbl_dba_BackupPlan
				 where xDaily = 'N' and xBkupType = 'DIFF'
				 and (charindex(convert(char(1),@NumWeek),xWeekly,1) = 0 or xWDayName <> xMDayName)
				 and xMonthly = 'Y' and xWOfMonth = @NumWeek
				 and xMDayName = datename(dw,getdate())
				 order by xdatabase
	
	open curFB
	fetch curFB into @database

	while @@fetch_status = 0
	begin

		exec usp_tbl_dba_diff_backup @database = @database, @execute='Y'	

		fetch curFB into @database

	end
	close curFB
	deallocate curFB

	print 'Monthly backup process completed.....'
	-- Monthly Schedule processing over

GO
ALTER TABLE [dbo].[tbl_dba_TSMReport_Config]  WITH CHECK ADD  CONSTRAINT [cons_Disp] CHECK  (([Display]='N' OR [Display]='Y'))
GO
ALTER TABLE [dbo].[tbl_dba_TSMReport_Config] CHECK CONSTRAINT [cons_Disp]
GO
ALTER TABLE [dbo].[tbl_dba_BackupPlan]  WITH CHECK ADD  CONSTRAINT [CK_tbl_dba_BackupPlan_Daily] CHECK  (([xDaily]='Y' OR [xDaily]='N'))
GO
ALTER TABLE [dbo].[tbl_dba_BackupPlan] CHECK CONSTRAINT [CK_tbl_dba_BackupPlan_Daily]
GO
ALTER TABLE [dbo].[tbl_dba_BackupPlan]  WITH CHECK ADD  CONSTRAINT [CK_tbl_dba_BackupPlan_Monthly] CHECK  (([xMonthly]='Y' OR [xMonthly]='N'))
GO
ALTER TABLE [dbo].[tbl_dba_BackupPlan] CHECK CONSTRAINT [CK_tbl_dba_BackupPlan_Monthly]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_updatestats] CHECK  (([xupdatestats]='Y' OR [xupdatestats]='N'))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_updatestats]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_updateusage] CHECK  (([xupdateusage]='Y' OR [xupdateusage]='N'))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_updateusage]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_xAlterIndex] CHECK  (([xAlterIndex]='Y' OR [xAlterIndex]='N'))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_xAlterIndex]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_xcheckdb] CHECK  (([xcheckdb]='Y' OR [xcheckdb]='N'))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_xcheckdb]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_xdiff] CHECK  (([xdiff]='Y' OR [xdiff]='N'))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_xdiff]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_xfull] CHECK  (([xfull]='Y' OR [xfull]='N'))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_xfull]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_xlog] CHECK  (([xlog]='Y' OR [xlog]='N'))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_xlog]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_xRaiseTicket] CHECK  (([xRaiseTicket]=(1) OR [xRaiseTicket]=(0)))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_xRaiseTicket]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_xreindex] CHECK  (([xreindex]='Y' OR [xreindex]='N'))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_xreindex]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_xskip] CHECK  (([xskip]=(1) OR [xskip]=(0)))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_xskip]
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config]  WITH NOCHECK ADD  CONSTRAINT [CK_tbl_dba_maintenance_xskipManual] CHECK  (([xskipManual]=(1) OR [xskipManual]=(0)))
GO
ALTER TABLE [dbo].[tbl_dba_maintenance_config] CHECK CONSTRAINT [CK_tbl_dba_maintenance_xskipManual]
GO
--************************************************************
--Object Deployment Over
--************************************************************
print 'Object Creation over.'
insert into [tbl_dba_TSMReport_Config] values('bak','Y')
insert into [tbl_dba_TSMReport_Config] values('trn','Y')
insert into [tbl_dba_TSMReport_Config] values('dif','Y')
GO

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		:	To check SQL Version and if it is SQL 2008, the script will update the xupdateusage column to "N" on the [dbo].[tbl_dba_maintenance_config] table. In addition we need to this this will remove the command to update usage in the PSDBA updateusage job . 
Created on	: 	11/02/2008
Version		:	1.0
dependencies	: Table					
		  tbl_dba_maintenance_config			
-----------------------------------------------------------------------------------------------------*/

ALTER TABLE [tbl_dba_maintenance_config] DROP CONSTRAINT [DF_tbl_dba_maintenance_xupdateusage] ;
ALTER TABLE [tbl_dba_maintenance_config] ADD CONSTRAINT [DF_tbl_dba_maintenance_xupdateusage]  DEFAULT ('N') FOR [xupdateusage] ;
Update [tbl_dba_maintenance_config] Set [xupdateusage] = 'N';
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: This function will return as a smallint value the SQL Server version, 2000, 2005 or 2008
Created on	: 23/03/2010
Version		: 1
----------------------------------------------------------------------------------------------------------------------------*/
CREATE FUNCTION [dbo].[ufn_dba_getMajorVersion]()
returns smallint
with encryption
as
begin
	declare @result int;
	select @result = null;
	
	declare @version varchar(47)
	select @version = @@version
	if charindex(N'2000',@version,1)>0 SET @result = 2000;
	else if charindex(N'2005',@version,1)>0 SET @result = 2005;
	else if charindex(N'2008',@version,1)>0 SET @result = 2008;
	else if charindex(N'2012',@version,1)>0 SET @result = 2012;

	return @result;
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: This procedure will call the log shipping backup job for that database
Created on	: 23/03/2010
Version		: 1
----------------------------------------------------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[usp_dba_CallLogShippingBackupJob]
(
	@database varchar(100) = NULL,
	@execute char(1) = N'N'
)
with encryption
as
begin
	set nocount on;
	
	declare @BackupJobId uniqueidentifier
	declare @backupJobName sysname

	Set @BackupJobId = null
	set @backupJobName = null

	declare @intVersion int;
	set @intVersion = DBA.dbo.ufn_dba_getMajorVersion();
	if @intVersion = 2000
	begin
		if ((select count (*)
		from msdb.dbo.log_shipping_databases l
		inner join msdb.dbo.sysdbmaintplan_jobs mj
		on mj.plan_id = l.maintenance_plan_id 
		inner join msdb.dbo.sysjobs sj
		on sj.job_id = mj.job_id
		Where l.database_name = @database) <> 1)
		begin
			raiserror (N'No LS backup job found or more than one was found, please check the LS server configuration',16, 1)
			return;
		end
		else
			select @BackupJobId = sj.job_id,
				@backupJobName = sj.name
			from msdb.dbo.log_shipping_databases l
			inner join msdb.dbo.sysdbmaintplan_jobs mj
			on mj.plan_id = l.maintenance_plan_id 
			inner join msdb.dbo.sysjobs sj
			on sj.job_id = mj.job_id
			Where l.database_name = @database;
	end
	else
	begin
		select @BackupJobId = pd.backup_job_id,
			   @backupJobName = sj.name
		from msdb..log_shipping_primary_databases pd 
		inner join msdb..sysjobs sj
		on sj.job_id = pd.backup_job_id
		Where pd.primary_database = @database;
	end
	
	print N' '
	if (@BackupJobId is not null)
	begin
		if (@execute = N'Y')
		begin
			--This will execute the logshipping backup job
			print N'Executed logshipping backup job'
			exec msdb..sp_start_job @job_id = @BackupJobId
		end
		else
		begin
			print N'Set parameter @execute to call the backup job'
			print @backupJobName;
		end
	end
	else
	begin
		print N'Database [' + @database + N'] does not have a backup job or is not a primary logshipping database'
	end
end
GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Purpose		: This function will return 'Y' if the database is a primary log-shipping database
Created on	: 23/03/2010
Version		: 1
----------------------------------------------------------------------------------------------------------------------------*/
CREATE FUNCTION [dbo].[ufn_dba_IsLogShippingDatabase]
(
	@database varchar(100) = NULL
)
returns
	char(1)
with encryption
as
begin
	declare @result char(1)
	set @result = N'N'
	declare @intVersion int;
	set @intVersion = DBA.dbo.ufn_dba_getMajorVersion();
	
	if @intVersion = 2000
	begin
		if Exists(Select TOP 1 database_name
		FROM msdb.dbo.log_shipping_databases
		WHERE upper(database_name) = upper(@database))
			Set @result = N'Y'
	end
	else	
	begin
		if Exists(SELECT TOP 1 primary_database
		FROM msdb.dbo.log_shipping_primary_databases
		Where upper(primary_database) = upper(@database))
			Set @result = N'Y'
	end
	
	return @result
end

GO
/****** Object:  Table [dbo].[tbl_dba_Version] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: July 1, 2010
-- Description:	The table tbl_dba_Version will store information of patches.
--
-- Dependencies: 
--		  Table: 
--    Procedure:
--	  Functions:
--
-- Samples on how to use this object
-- select * from tbl_dba_Version
-- =============================================
CREATE TABLE [dbo].[tbl_dba_Version](
	Version_ID int IDENTITY(1,1) NOT NULL,
	MajorVersion int NOT NULL default 0	constraint tbl_dba_Version_CK_MajorVersion check (MajorVersion >= 0),
	MinorVersion int NOT NULL default 0	constraint tbl_dba_Version_CK_MinorVersion check (MinorVersion >= 0),
	Notes nvarchar(4000) NOT NULL,
	Active Char(1) NOT NULL default 'Y'	constraint tbl_dba_Version_CK_Active check (Active in ('Y','N')),
	SysInsDate datetime not null	default getdate(),
	SysInsUsr varchar(50) not null	default current_user,
	SysUpdDate datetime NULL,
	SysUpdUsr varchar(50) NULL,
 CONSTRAINT Version_ID_PK PRIMARY KEY CLUSTERED ([Version_ID] ASC )ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date : July 1, 2010
-- Description : Trigger to update the record storing the user and date of the modification
-- Dependencies: 
--		  Table: tbl_dba_Version					
--    Procedure:
--	  Functions:

-- =============================================
CREATE TRIGGER [dbo].[tu_tbl_dba_Version]		
ON [dbo].[tbl_dba_Version]		
WITH ENCRYPTION			
AFTER UPDATE			
AS			
BEGIN			
SET NOCOUNT ON;			
	UPDATE tbl_dba_Version
	SET SysUpdDate = getdate(),		
	    SysUpdUsr = current_user
	FROM tbl_dba_Version		
	INNER JOIN inserted		
	ON tbl_dba_Version.Version_ID = inserted.Version_ID;		
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: July 1, 2010
-- Description:	Stored procedure to increment the version of the database
-- Dependencies: 
--		  Table: tbl_dba_Version					
--    Procedure:
--	  Functions:
--
-- Samples on how to use this object
-- exec usp_dba_IncDBAVersion @pNotes = 'version 1', @pIncreaseMajorVersion = 'Y'
-- exec usp_dba_IncDBAVersion @pNotes = 'Beta version', @pIncreaseMajorVersion = 'N'
-- exec usp_dba_IncDBAVersion @pNotes = 'Log shipping Fix', @pIncreaseMajorVersion = 'N'
-- =============================================
CREATE PROCEDURE [dbo].[usp_dba_IncDBAVersion]
(
	@pNotes nvarchar(4000),
	@pIncreaseMajorVersion char(1) = 'N'
)
with encryption
as
begin
	set nocount on;
	
	if (@pNotes IS NULL)
	begin
		raiserror('Parameter @pNotes can not be null', 16, 1);
		if @@ERROR != 0 GOTO ExitProc
	end
	
	declare @lMajorVersion int;
	declare @lMinorVersion int;
	
	select @lMajorVersion = MajorVersion,
		   @lMinorVersion = MinorVersion
	from tbl_dba_Version 
	where Active = 'Y';
	
	set @lMinorVersion = isnull(@lMinorVersion, 0)
	set @lMajorVersion = isnull(@lMajorVersion, 0)
		   
	if (@pIncreaseMajorVersion <> 'N')
	begin
		--increase major version and set minor version = 0
		Set @lMajorVersion = @lMajorVersion + 1;
		Set @lMinorVersion = 0;
	end
	else
	begin
		--keep major version and increase minor version
		Set @lMinorVersion = @lMinorVersion + 1;
	end;
	
	begin transaction
	
	update tbl_dba_Version 
	set Active = 'N' 
	Where Active = 'Y';
	if @@ERROR != 0 GOTO HandleError
	
	Insert tbl_dba_Version (MajorVersion, MinorVersion, Notes) values (@lMajorVersion, @lMinorVersion, @pNotes)

	if @@ERROR != 0 GOTO HandleError

	if @@TRANCOUNT > 0	
		commit transaction;
	
	if @@ERROR != 0 GOTO HandleError ELSE GOTO ExitProc
	
	--if (@@ERROR <> 0)
	--begin
	--	if @@TRANCOUNT > 0	
	--		rollback transaction
	--end
	--else
	--begin
	--	if @@TRANCOUNT > 0	
	--		commit transaction;
	--end
	
	HandleError:
		if @@TRANCOUNT > 0	
			rollback transaction
	
	ExitProc:
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: July 1, 2010
-- Description:	procedure to get the version of the databse and last modification date
-- Dependencies: 
--		  Table: tbl_dba_Version					
--    Procedure:
--	  Functions:
--
--------------------------------------
-- Samples on how to use the object
--
-- exec DBA..usp_tbl_dba_DBAVersion
-- exec DBA..usp_tbl_dba_DBAVersion 'Y'
-- =============================================
CREATE PROCEDURE [dbo].[usp_tbl_dba_DBAVersion]
(
	@displayAll char(1) = 'N' --Valid values are: 'Y', 'N'
)	
with encryption
AS
BEGIN
	SET @displayAll = upper(@displayAll);
	
	IF (@displayAll = 'Y')
	BEGIN
		SELECT * FROM tbl_dba_Version
	END
	ELSE
	BEGIN
		SELECT CAST(MajorVersion as Varchar(3)) + '.' + replicate('0',3 - LEN(CAST(ISNULL(MinorVersion, '0') as varchar(3)))) + CAST(ISNULL(MinorVersion, '0') as varchar(3)) as version, Notes, Active, SysInsDate ins_date FROM tbl_dba_Version
		WHERE Active = 'Y'
	END;
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: July 1, 2010
-- Description:	function to get the version of the databse as a numeric value
-- Dependencies: 
--		  Table: tbl_dba_Version					
--    Procedure:
--	  Functions:
--
--------------------------------------
-- Samples on how to use the object
--
-- select DBA.dbo.uf_tbl_dba_getDBAVersion()
-- =============================================
CREATE FUNCTION [dbo].[uf_tbl_dba_getDBAVersion]()
RETURNS NUMERIC (10 ,5)
with encryption
AS
BEGIN
	DECLARE @lVersion NUMERIC (10, 5);
	
	SELECT @lVersion = CAST(ISNULL(MajorVersion,'0') as Varchar(3)) + '.' + replicate('0',3 - LEN(CAST(ISNULL(MinorVersion, '0') as varchar(3)))) + CAST(ISNULL(MinorVersion, '0') as varchar(3))
	FROM tbl_dba_Version
	WHERE Active = 'Y';
	
	if (@lVersion is null)
		SET @lVersion = 0;
	
	RETURN @lVersion;
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: July 1, 2010
-- Description:	Stored procedure to increment the version of the database
-- Dependencies: 
--		  Table: tbl_dba_Version					
--    Procedure:
--	  Functions:
--
-- Samples on how to use this object
-- exec usp_dba_SetDBAVersion @pMajorVersion = 2, @pMinorVersion = 1, @pNotes = 'version 2.1'
-- =============================================
CREATE PROCEDURE [dbo].[usp_dba_SetDBAVersion]
(
	@pMajorVersion int,
	@pMinorVersion int,
	@pNotes nvarchar(4000)
)
with encryption
as
begin
	set nocount on;

	if (@pMajorVersion IS NULL)
		raiserror('Parameter @pMajorVersion can not be null', 16, 1);
	
	if (@pMinorVersion IS NULL)
		raiserror('Parameter @pMinorVersion can not be null', 16, 1);

	if (@pNotes IS NULL)
		raiserror('Parameter @pNotes can not be null', 16, 1);
	
	declare @currentVersion numeric(10, 5);
	declare @newVersion numeric(10, 5);
	
	select @currentVersion = DBA.dbo.uf_tbl_dba_getDBAVersion();
	
	Set @newVersion = CAST(@pMajorVersion as varchar(3)) + '.' + replicate('0',3 - LEN(cast(@pMinorVersion as varchar))) + cast(@pMinorVersion as varchar)
	
	if (@newVersion <= @currentVersion)
	begin
		declare @strErrorMessage varchar(80);
		set @strErrorMessage  = 'The new version (' + CAST(@newVersion as varchar(11)) + ') must be grater than the current version (' + CAST(@currentVersion as varchar(11)) + ')';
		raiserror(@strErrorMessage, 16, 1);
		if @@ERROR != 0 GOTO ExitProc
	end
	
	begin transaction
	
	update tbl_dba_Version 
	set Active = 'N' 
	Where Active = 'Y';

	Insert tbl_dba_Version (MajorVersion, MinorVersion, Notes) values (@pMajorVersion, @pMinorVersion, @pNotes)

	if @@ERROR != 0 GOTO HandleError

	if @@TRANCOUNT > 0	
		commit transaction;
	
	if @@ERROR != 0 GOTO HandleError ELSE GOTO ExitProc
	
	--if (@@ERROR <> 0)
	--begin
	--	if @@TRANCOUNT > 0	
	--		rollback transaction
	--end
	--else
	--begin
	--	if @@TRANCOUNT > 0	
	--		commit transaction;
	--end
	
	HandleError:
		if @@TRANCOUNT > 0	
			rollback transaction
	
	ExitProc:
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: July 1, 2010
-- Description:	function to know if an update or package exists based on the description, if it does it will return the version of the first match found otehrwise return 0
-- Dependencies: 
--		  Table: tbl_dba_Version					
--    Procedure:
--	  Functions:
--
--------------------------------------
-- Samples on how to use the object
--
-- select DBA.dbo.uf_tbl_dba_packageExist('initial Version')
-- =============================================
CREATE FUNCTION [dbo].[uf_tbl_dba_packageExist](@pNotes nvarchar(4000))
RETURNS NUMERIC (10 ,5)
with encryption
AS
BEGIN
	DECLARE @lVersion NUMERIC (10, 5);
	
	SELECT top 1 @lVersion = CAST(ISNULL(MajorVersion,'0') as Varchar(5)) + '.' + CAST(ISNULL(MinorVersion, '0') as varchar(5)) 
	  FROM tbl_dba_Version 
 	 WHERE upper(Notes) like '%' + upper(@pNotes) + '%'
	
	if (@lVersion is null)
		SET @lVersion = 0;
	
	RETURN @lVersion;
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: July 29, 2010
-- Description:	Function to get Y the Server supports compression
-- Dependencies: 
--		  Table: 
--    Procedure:
--	  Functions:
--
--------------------------------------
-- Samples on how to use the object
--
-- select DBA.dbo.uf_dba_CompressionSupported()
-- =============================================
CREATE FUNCTION [dbo].[uf_dba_CompressionSupported]()
RETURNS CHAR(1)
with encryption
AS
BEGIN
	DECLARE @lResult CHAR(1) = 'N';
	
	declare @strProductVersion varchar(128);
	declare @ProductVersion decimal(4,2);
	select @strProductVersion = CAST(SERVERPROPERTY('productversion') as varchar);
	select @ProductVersion = SUBSTRING(@strProductVersion, 0, charindex('.', @strProductVersion, charindex('.', @strProductVersion) + 1))

	declare @edition varchar(128);
	select @edition = CAST(SERVERPROPERTY('Edition') as varchar);

	if (@ProductVersion = 10.50) and @edition in ('Developer Edition (64-bit)', 'Developer Edition (64-bit)', 'Enterprise Edition (64-bit)', 'Enterprise Evaluation Edition (64-bit)', 'Standard Edition (64-bit)')
	or (@ProductVersion = 10.50) and @edition in ('Developer Edition', 'Developer Edition', 'Enterprise Edition', 'Enterprise Evaluation Edition', 'Standard Edition')
	or (@ProductVersion = 10.00) and @edition in ('Developer Edition (64-bit)', 'Enterprise Edition (64-bit)', 'Enterprise Evaluation Edition (64-bit)') 
	or (@ProductVersion = 10.00) and @edition in ('Developer Edition', 'Enterprise Edition', 'Enterprise Evaluation Edition') 
		SET @lResult = 'Y';
	
	RETURN @lResult;
END
GO
--Alter table [tbl_dba_maintenance_config] to add xCompression column default 'N' valid values 'N', 'Y'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

If not Exists (select object_id from sys.columns where name = 'xCompression' and object_id = object_id(N'tbl_dba_maintenance_config', 'U'))
	ALTER TABLE [dbo].[tbl_dba_maintenance_config]
			ADD [xCompression][char](1) NOT NULL CONSTRAINT [DF_tbl_dba_maintenance_xCompression] DEFAULT ('N') CONSTRAINT [CK_tbl_dba_maintenance_xCompression] CHECK(xCompression in ('N', 'Y'))
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
if OBJECT_ID(N'tbl_dba_TempDB_Monitor_Version_Store', N'U') is not null
	DROP table tbl_dba_TempDB_Monitor_Version_Store;
GO
if OBJECT_ID(N'usp_dba_TempDB_Monitor_Version_Store', N'P') is not null
	DROP procedure usp_dba_TempDB_Monitor_Version_Store;
GO

Create table dbo.tbl_dba_TempDB_Monitor_Version_Store (
[datetime] datetime not null default getdate(),
[query_name] nvarchar(max),
[transaction_id] bigint,
[transaction_sequence_num] bigint,
[elapsed_time_seconds] bigint) ON [PRIMARY]
GO

CREATE procedure [dbo].[usp_dba_TempDB_Monitor_Version_Store]
(
	@returnData	varchar(1) = N'N' -- Valid values for this parameter are 'Y' and 'N'
)
with encryption
as
begin
	Set nocount on;
	
	SET @returnData = UPPER(@returnData);
	
	Delete from DBA..tbl_dba_TempDB_Monitor_Version_Store
	where [datetime] <= dateadd(month, -1, GETDATE());
	
	INSERT INTO DBA..tbl_dba_TempDB_Monitor_Version_Store (
	[query_name],
	[transaction_id],
	[transaction_sequence_num],
	[elapsed_time_seconds])
	SELECT   qt.text query_name,
			 dm_tran_active_snapshot_database_transactions.transaction_id,
			 transaction_sequence_num,
			 elapsed_time_seconds
	FROM     sys.dm_tran_active_snapshot_database_transactions,
			 sys.dm_tran_session_transactions,
			 sys.dm_exec_requests
			 OUTER APPLY sys.dm_exec_sql_text(sql_handle) qt
	WHERE    sys.dm_tran_active_snapshot_database_transactions.transaction_id = sys.dm_tran_session_transactions.transaction_id
			 AND sys.dm_exec_requests.session_id = sys.dm_tran_session_transactions.session_id
	ORDER BY elapsed_time_seconds DESC
	
	
	if @returnData = N'Y'
	Select * from DBA..tbl_dba_TempDB_Monitor_Version_Store
	where [datetime] = (select MAX([datetime]) from tbl_dba_TempDB_Monitor_Version_Store)
end
GO
--------------------------------------------
if OBJECT_ID(N'tbl_dba_TempDB_Monitor_Space_Usage', N'U') is not null
	DROP table tbl_dba_TempDB_Monitor_Space_Usage;
GO
if OBJECT_ID(N'usp_dba_TempDB_Monitor_Space_Usage', N'P') is not null
	DROP procedure usp_dba_TempDB_Monitor_Space_Usage;
GO

Create table dbo.tbl_dba_TempDB_Monitor_Space_Usage (
[datetime] datetime not null default getdate(),
[usr_obj_kb] bigint,
[internal_obj_kb] bigint,
[version_store_kb] bigint,
[freespace_kb] bigint,
[mixedextent_kb] bigint) ON [PRIMARY]
GO
CREATE procedure [dbo].[usp_dba_TempDB_Monitor_Space_Usage]
(
	@returnData	varchar(1) = N'N' -- Valid values for this parameter are 'Y' and 'N'
)
with encryption
as
begin
	Set nocount on;
	
	SET @returnData = UPPER(@returnData);
	
	Delete from DBA..tbl_dba_TempDB_Monitor_Space_Usage
	where [datetime] <= dateadd(month, -1, GETDATE());
	
	INSERT INTO DBA..tbl_dba_TempDB_Monitor_Space_Usage (
	[usr_obj_kb],
	[internal_obj_kb],
	[version_store_kb],
	[freespace_kb],
	[mixedextent_kb])
	SELECT SUM (user_object_reserved_page_count) *8 AS usr_obj_kb ,
	SUM (internal_object_reserved_page_count)*8 AS internal_obj_kb ,
	SUM (version_store_reserved_page_count) *8 AS version_store_kb,
	SUM (unallocated_extent_page_count) *8 AS freespace_kb ,
	SUM (mixed_extent_page_count) * 8 AS mixedextent_kb
	FROM sys.dm_db_file_space_usage	
	
	if @returnData = N'Y'
	Select * from DBA..tbl_dba_TempDB_Monitor_Space_Usage
	where [datetime] = (select MAX([datetime]) from tbl_dba_TempDB_Monitor_Space_Usage)
end
GO
--------------------------------------------
if OBJECT_ID(N'tbl_dba_TempDB_Monitor_Objects', N'U') is not null
	DROP table tbl_dba_TempDB_Monitor_Objects;
GO
if OBJECT_ID(N'usp_dba_TempDB_Monitor_Objects', N'P') is not null
	DROP procedure usp_dba_TempDB_Monitor_Objects;
GO

Create table dbo.tbl_dba_TempDB_Monitor_Objects (
	[datetime] datetime not null default getdate(),
	[session_id] smallint,
	[Text] nvarchar(max),
	[internal_objects_alloc_page_count] bigint,
	[internal_objects_dealloc_page_count] bigint,
	[user_objects_alloc_page_count] bigint,
	[user_objects_dealloc_page_count] bigint,
	[client_net_address] varchar(48),
	[host_name] nvarchar(128),
	[program_name] nvarchar(128),
	[last_request_start_time] datetime,
	[last_request_end_time] datetime,
	[login_time] datetime,
	[cpu_time] int,
	[memory_usage] int,
	[reads] bigint,
	[writes] bigint,
	[logical_reads] bigint,
	[status] nvarchar(30),
	[login_name] nvarchar(128),
	[nt_domain] nvarchar(128),
	[nt_user_name] nvarchar(128),	
	[open_transactions] bigint) ON [PRIMARY]
GO
CREATE procedure [dbo].[usp_dba_TempDB_Monitor_Objects]
(
	@returnData	varchar(1) = N'N' -- Valid values for this parameter are 'Y' and 'N'
)
with encryption
as
begin
	Set nocount on;
	
	SET @returnData = UPPER(@returnData);
	
	Delete from DBA..tbl_dba_TempDB_Monitor_Objects
	where [datetime] <= dateadd(month, -1, GETDATE());
	
	INSERT INTO DBA..tbl_dba_TempDB_Monitor_Objects (
		[session_id],
		[Text],
		[internal_objects_alloc_page_count],
		[internal_objects_dealloc_page_count],
		[user_objects_alloc_page_count],
		[user_objects_dealloc_page_count],
		[client_net_address],
		[host_name],
		[program_name],
		[last_request_start_time],
		[last_request_end_time],
		[login_time],
		[cpu_time],
		[memory_usage],
		[reads],
		[writes],
		[logical_reads],
		[status],
		[login_name],
		[nt_domain],
		[nt_user_name],
		[open_transactions])
	SELECT r1.session_id,
         r5.TEXT,
         r1.internal_objects_alloc_page_count + r2.task_internal_objects_alloc_page_count     AS internal_objects_alloc_page_count,
         r1.internal_objects_dealloc_page_count + r2.task_internal_objects_dealloc_page_count AS internal_objects_dealloc_page_count,
         r1.user_objects_alloc_page_count + r2.task_user_objects_alloc_page_count             AS user_objects_alloc_page_count,
         r1.user_objects_dealloc_page_count + r2.task_user_objects_dealloc_page_count         AS user_objects_dealloc_page_count,
         r3.client_net_address,
         r4.host_name,
         r4.program_name,
         r4.last_request_start_time,
         r4.last_request_end_time,
         r4.login_time,
         r4.cpu_time,
         r4.memory_usage,
         r4.reads,
         r4.writes,
         r4.logical_reads,
         r4.status,
         r4.login_name,
         r4.nt_domain,
         r4.nt_user_name,
         (SELECT Count(1)
            FROM sys.dm_tran_session_transactions t1
           WHERE t1.session_id = r1.session_id) AS open_transactions
           
	FROM sys.dm_db_session_space_usage AS r1,
    (SELECT session_id,
			Sum(internal_objects_alloc_page_count)   AS task_internal_objects_alloc_page_count,
            Sum(internal_objects_dealloc_page_count) AS task_internal_objects_dealloc_page_count,
            Sum(user_objects_alloc_page_count)       AS task_user_objects_alloc_page_count,
            Sum(user_objects_dealloc_page_count)     AS task_user_objects_dealloc_page_count
	FROM sys.dm_db_task_space_usage
	WHERE session_id > 50
	GROUP BY session_id) AS r2,
	sys.dm_exec_sessions r4,
	sys.dm_exec_connections r3
	OUTER APPLY sys.dm_exec_sql_text(most_recent_sql_handle) r5
	WHERE r1.session_id = r2.session_id
		AND r3.most_recent_session_id = r2.session_id
		AND r3.most_recent_session_id = r4.session_id
		AND r1.session_id > 50
	ORDER BY internal_objects_alloc_page_count DESC,
    user_objects_alloc_page_count DESC

	if @returnData = N'Y'
	Select * from DBA..tbl_dba_TempDB_Monitor_Objects
	where [datetime] = (select MAX([datetime]) from DBA..tbl_dba_TempDB_Monitor_Objects)
end
GO
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date : August 5, 2010
-- Description : Trigger to audit Login changes at a server level
-- Dependencies: 
--		  Table: 					
--    Procedure:
--	  Functions:
-- =============================================
CREATE TRIGGER t_ryderdba_0
ON ALL SERVER
WITH ENCRYPTION
FOR CREATE_LOGIN, ALTER_LOGIN, DROP_LOGIN
AS 
BEGIN
	DECLARE @EventType VARCHAR(50)
	DECLARE @ObjectName VARCHAR(256)
	DECLARE @LoginName VARCHAR(256)
    DECLARE @TSQLCommand VARCHAR(max)
	DECLARE @Message VARCHAR(2000)
	
	SELECT @EventType = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)') 
	SELECT @ObjectName = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(256)')
	SELECT @LoginName = EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(256)')
	--SELECT @TSQLCommand = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'varchar(max)')

	IF @EventType IS NULL SET @EventType = ''
	IF @ObjectName IS NULL SET @ObjectName = ''
	IF @LoginName IS NULL SET @LoginName = ''
	IF @TSQLCommand IS NULL SET @TSQLCommand = ''

	SELECT @Message = 'DBA Informational: ' + @EventType + ' was executed for object ' + @ObjectName + ' by ' + @LoginName + ' TSQL: ' + @TSQLCommand

	IF LEN(@Message) > 1998
		SET @Message = SUBSTRING(@Message, 0, 1993) + '...';
		
	SET @Message = QUOTENAME(@Message, '"');
	RAISERROR(@Message, 1,1 ) WITH LOG, NOWAIT -- Informational Message 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date : August 5, 2010
-- Description : Trigger to audit create, delete or alter database statement executions at a server level
-- Dependencies: 
--		  Table: 					
--    Procedure:
--	  Functions:
-- =============================================
CREATE TRIGGER t_ryderdba_1
ON ALL SERVER
WITH ENCRYPTION
FOR CREATE_DATABASE, DROP_DATABASE, ALTER_DATABASE
AS 
BEGIN
	DECLARE @EventType VARCHAR(50)
	DECLARE @ObjectName VARCHAR(256)
	DECLARE @LoginName VARCHAR(256)
    DECLARE @TSQLCommand VARCHAR(max)
	DECLARE @Message VARCHAR(2000)
	
	SELECT @EventType = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)')
	SELECT @ObjectName = EVENTDATA().value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(256)')
	SELECT @LoginName = EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(256)')
	--SELECT @TSQLCommand = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'varchar(max)')

	IF @EventType IS NULL SET @EventType = ''
	IF @ObjectName IS NULL SET @ObjectName = ''
	IF @LoginName IS NULL SET @LoginName = ''
	IF @TSQLCommand IS NULL SET @TSQLCommand = ''


	IF (@EventType = 'ALTER_DATABASE') --and (lower(@TSQLCommand) like '%recovery model%'))
		SELECT @Message = 'DBA_Informational: ' + @EventType + ' was executed for object ' + @ObjectName + ' by ' + @LoginName + ' TSQL: ' + @TSQLCommand
	ELSE
		SELECT @Message = 'DBA Informational: ' + @EventType + ' was executed for object ' + @ObjectName + ' by ' + @LoginName + ' TSQL: ' + @TSQLCommand

	IF LEN(@Message) > 1998
		SET @Message = SUBSTRING(@Message, 0, 1993) + '...';
		
	SET @Message = QUOTENAME(@Message, '"');
	
	RAISERROR(@Message, 1,1 ) WITH LOG, NOWAIT -- Informational Message 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date : August 5, 2010
-- Description : Trigger to audit server role changes at a server level
-- Dependencies: 
--		  Table: 					
--    Procedure:
--	  Functions:
-- =============================================
CREATE TRIGGER t_ryderdba_4
ON ALL SERVER
WITH ENCRYPTION
FOR ADD_SERVER_ROLE_MEMBER,	DROP_SERVER_ROLE_MEMBER
AS 
BEGIN
	DECLARE @EventType VARCHAR(50);
	DECLARE @ObjectName VARCHAR(256);
	DECLARE @LoginName VARCHAR(256);
    DECLARE @TSQLCommand VARCHAR(max);
	DECLARE @Message VARCHAR(2000);
	DECLARE @Exclude CHAR(1);
	SET @Exclude = 'N';
	
	SELECT @EventType = ISNULL(EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)') , '')
	SELECT @ObjectName = ISNULL(EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(256)'), '')
	SELECT @LoginName = ISNULL(EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(256)'), '')
	--SELECT @TSQLCommand = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'varchar(max)')

	IF @EventType IS NULL SET @EventType = ''
	IF @ObjectName IS NULL SET @ObjectName = ''
	IF @LoginName IS NULL SET @LoginName = ''
	IF @TSQLCommand IS NULL SET @TSQLCommand = ''

	SELECT @Message = 'DBA Informational: ' + @EventType + ' was executed for object ' + @ObjectName + ' by ' + @LoginName + ' TSQL: ' + @TSQLCommand

	IF LEN(@Message) > 1998
		SET @Message = SUBSTRING(@Message, 0, 1993) + '...';
		
	SET @Message = QUOTENAME(@Message, '"');
	RAISERROR(@Message, 1,1 ) WITH LOG, NOWAIT -- Informational Message 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date : August 5, 2010
-- Description : Trigger to audit Login changes at a server level
-- Dependencies: 
--		  Table: 					
--    Procedure:
--	  Functions:
-- =============================================
CREATE TRIGGER t_ryderdba_5
ON ALL SERVER
WITH ENCRYPTION
FOR ALTER_INSTANCE
AS 
BEGIN
	DECLARE @EventType VARCHAR(50)
	DECLARE @ObjectName VARCHAR(256)
	DECLARE @LoginName VARCHAR(256)
    DECLARE @TSQLCommand VARCHAR(max)
	DECLARE @Message VARCHAR(2000)
	DECLARE @Exclude CHAR(1);
	SET @Exclude = 'N';
	
	SELECT @EventType = ISNULL(EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)') , '')
	SELECT @ObjectName = ISNULL(EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(256)'), '')
	SELECT @LoginName = ISNULL(EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(256)'), '')
	--SELECT @TSQLCommand = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'varchar(max)')

	IF @EventType IS NULL SET @EventType = ''
	IF @ObjectName IS NULL SET @ObjectName = ''
	IF @LoginName IS NULL SET @LoginName = ''
	IF @TSQLCommand IS NULL SET @TSQLCommand = ''

	SELECT @Message = 'DBA Informational: sp_configure was executed by ' + @LoginName + ' TSQL: ' + @TSQLCommand;

	IF ((@EventType = 'ALTER_INSTANCE') and (lower(@TSQLCommand) like '%show advanced options%'))
		SET @Exclude = 'Y';

	IF @Exclude = 'N'
	BEGIN
		IF LEN(@Message) > 1998
			SET @Message = SUBSTRING(@Message, 0, 1993) + '...';
			
		SET @Message = QUOTENAME(@Message, '"');
		RAISERROR(@Message, 1,1 ) WITH LOG, NOWAIT -- Informational Message 
	END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: January 4, 2011
-- Description:	The table tbl_dba_LongRunningJobs will store information for long running jobs.
--
-- Dependencies: 
--		  Table: 
--    Procedure:
--	  Functions:
--
-- Samples on how to use this object
-- select * from tbl_dba_LongRunningJobs
-- =============================================
CREATE TABLE [dbo].[tbl_dba_longrunningjobs](
	[lastcheckdate] [datetime] default getdate(),
	[job_id] [uniqueidentifier] NULL,
	[jobname] [sysname] NULL,
	[logindatetime] [datetime] default getdate(),
	[expectedtimeminutes] [int] NULL,
	[overtimeminutes] [int] NULL,
 CONSTRAINT [tbl_dba_longrunningjobs_PK] PRIMARY KEY CLUSTERED 
([lastcheckdate] ASC)ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tbl_dba_longrunningjobs_IDX1] ON [dbo].[tbl_dba_longrunningjobs]
([jobname] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tbl_dba_longrunningjobs_IDX2] ON [dbo].[tbl_dba_longrunningjobs]
([overtimeminutes] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tbl_dba_longrunningjobs_IDX3] ON [dbo].[tbl_dba_longrunningjobs]
([expectedtimeminutes] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tbl_dba_longrunningjobs_IDX4] ON [dbo].[tbl_dba_longrunningjobs]
([logindatetime] ASC) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: January 4, 2011
-- Description:	The table tbl_dba_Jobs_Config will store configuration information for job doration.
--
-- Dependencies: 
--		  Table: 
--    Procedure:
--	  Functions:
--
-- Samples on how to use this object
-- select * from tbl_dba_Jobs_Config
-- =============================================
CREATE TABLE [dbo].[tbl_dba_jobs_config](
	[jobname] [sysname] not null,
	[expectedduration_minutes] int not null default 60 constraint tbl_dba_jobs_config_ck_expectedduration_minutes check (expectedduration_minutes >= 0),
	[alertduration_minutes] int not null default 120 constraint tbl_dba_jobs_config_ck_alertduration_minutes check (alertduration_minutes >= 0),
	[check] char(1) not null default N'N' constraint tbl_dba_jobs_config_ck_active check ([check] in (N'Y',N'N')),
	[sysinsdate] [datetime] not null default getdate(),
	[sysinsusr] [varchar](50) not null default user_name(),
	[sysupddate] [datetime] null,
	[sysupdusr] [varchar](50) null,
 CONSTRAINT [tbl_dba_Jobs_Config_JobName_PK] PRIMARY KEY CLUSTERED 
([jobname] ASC) ON [PRIMARY]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tbl_dba_jobs_config_IDX1] ON [dbo].[tbl_dba_jobs_config]
([jobname], [check] ASC) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date : January 04, 2011
-- Description : Trigger to update the record storing the user and date of the modification
-- Dependencies: 
--		  Table: tbl_dba_Jobs_Config					
--    Procedure:
--	  Functions:

-- =============================================
CREATE TRIGGER [dbo].[tu_tbl_dba_jobs_config]
on [dbo].[tbl_dba_jobs_config]		
WITH ENCRYPTION			
AFTER UPDATE
AS			
BEGIN			
SET NOCOUNT ON;			
	update tbl_dba_jobs_config
	set sysupddate = getdate(),		
	    sysupdusr = current_user
	from tbl_dba_jobs_config		
	inner join inserted		
	on tbl_dba_jobs_config.jobname = inserted.jobname;		
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date : May 25, 2004
-- Description : This function will take any binary value and return 
--               the hex value as a character representation.
--               In order to use this function you need to pass the 
--               binary hex value and the number of bytes you want to
--               convert.
-- Dependencies: 
--		  Table:
--    Procedure:
--	  Functions:
--Reference: http://www.databasejournal.com/features/mssql/article.php/3500276/Identifying-Long-Running-SQL-Server-Agent-Jobs.htm
-- =============================================
CREATE function [dbo].[fn_hex_to_char] (
  @x varbinary(100), -- binary hex value
  @l int -- number of bytes
  ) returns varchar(200)
WITH ENCRYPTION
AS
begin
	declare @i varbinary(10)
	declare @digits char(16)
	set @digits = N'0123456789ABCDEF'
	declare @s varchar(100)
	declare @h varchar(100)
	declare @j int
	set @j = 0 
	set @h = N''
	-- process all  bytes
	while @j < @l
	begin
	  set @j= @j + 1
	  -- get first character of byte
	  set @i = substring(cast(@x as varbinary(100)),@j,1)
	  -- get the first character
	  set @s = cast(substring(@digits,@i%16+1,1) as char(1))
	  -- shift over one character
	  set @i = @i/16 
	  -- get the second character
	  set @s = cast(substring(@digits,@i%16+1,1) as char(1)) + @s
	  -- build string of hex characters
	  set @h = @h + @s
	end
	return(@h)
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: January 4, 2011
-- Description:	The table tbl_dba_LongRunningJobs will store information for long running jobs.
--
-- Dependencies: 
--		  Table: 
--    Procedure:
--	  Functions:
--
-- Samples on how to use this object
-- select * from tbl_dba_LongRunningJobs
-- =============================================
CREATE PROCEDURE [dbo].[usp_tbl_dba_populate_jobs_config_table]
WITH ENCRYPTION
AS
BEGIN
	set nocount on
	
	insert into DBA.dbo.tbl_dba_jobs_config(
		[jobname],
		[expectedduration_minutes],
		[alertduration_minutes],
		[check])
	select sj.name, 
	case when (AVG(datediff(MI, sja.start_execution_date, sja.stop_execution_date)) = 0) then 1.15
		ELSE AVG(datediff(MI, sja.start_execution_date, sja.stop_execution_date)) * 1.15
		END,
	case when (AVG(datediff(MI, sja.start_execution_date, sja.stop_execution_date)) = 0) then 1.40
		ELSE AVG(datediff(MI, sja.start_execution_date, sja.stop_execution_date)) * 1.40
		END,
	case when (sj.name like N'-- RyderDBA%') then
		N'Y'
	ELSE
		N'N'
	END
	from msdb.dbo.sysjobs sj
	inner join msdb.dbo.sysjobactivity sja
	on sj.job_id = sja.job_id
	where sj.name not in (select jc.jobname from DBA.dbo.tbl_dba_jobs_config jc)
	and sja.start_execution_date is not null
	and sja.stop_execution_date is not null
	group by sj.name
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date : May 25, 2004, January 4, 2011
-- Description : This stored procedure will detect long running jobs.  
--              A long running job is defined as a job that has 
--              been running longer than expected based in the DBA database configuration
-- Dependencies: 
--		  Table:
--    Procedure:
--	  Functions:
--Reference: http://www.databasejournal.com/features/mssql/article.php/3500276/Identifying-Long-Running-SQL-Server-Agent-Jobs.htm
-- =============================================
CREATE PROCEDURE [dbo].[usp_long_running_jobs]
(
	@showresult char(1) = N'N',
	@HistoryInMonds int = 6
)
WITH ENCRYPTION
AS
BEGIN
	set nocount on; 
	--Populate the Job configuration table 
	execute DBA.dbo.usp_tbl_dba_populate_jobs_config_table;

	declare @c char(1000)
	declare @cnt int
	------------------
	-- Creating temporary tables
	------------------
	IF OBJECT_ID(N'[tempdb]..[#enum_job]') IS NOT NULL
		DROP TABLE #enum_job;
	create table #enum_job ( 
	job_id uniqueidentifier,
	last_run_date int,
	last_run_time int,
	next_run_date int,
	next_run_time int,
	next_run_schedule_id int,
	requested_to_run int,
	request_source int,
	request_source_id varchar(100),
	running int,
	current_step int,
	current_retry_attempt int, 
	state int)       

	IF OBJECT_ID(N'[tempdb]..[#jobs]') IS NOT NULL
		DROP TABLE #jobs;
	create table #jobs (
	job_id uniqueidentifier, 
	job_id_char varchar(100))

	IF OBJECT_ID(N'[tempdb]..[#long_running_jobs]') IS NOT NULL
		DROP TABLE #long_running_jobs;
	create table #long_running_jobs ( 
		[lastcheckdate] datetime default getdate(),
		[job_id] uniqueidentifier, 
		[jobname] [sysname] null,
		[logindatetime] [datetime] default getdate(),
		[expectedtimeminutes] [int] null,
		[overtimeminutes] [int] null)

	---------------------
	-- Get a list of jobs 	
	---------------------
	insert into #enum_job 
	execute master.dbo.xp_sqlagent_enum_jobs 1, N'XXXX' -- The value of the second parameter is ignored since the vale of the first one is 1

	insert into #jobs 
	select job_id, DBA.dbo.fn_hex_to_char(job_id,16)
	from #enum_job

	------------------
	-- Getting the long running jobs
	------------------
		Insert into [dbo].[#long_running_jobs](
			job_id,
			jobname,
			logindatetime,
			expectedtimeminutes,
			overtimeminutes)
		select 
			c.job_id, 
			c.name, 
			min(a.login_time), 
			jc.expectedduration_minutes,
			max(datediff(mi,a.login_time, getdate()))
			
		from master.dbo.sysprocesses a
		inner join #jobs b
			on  substring(a.program_name,32,32)= b.job_id_char
		inner join msdb.dbo.sysjobs c 
			on b.job_id = c.job_id
		inner join DBA.dbo.tbl_dba_jobs_config jc
			on (jc.jobname = c.name and jc.[check] = N'Y')
		where a.login_time < dateadd(MI,(jc.expectedduration_minutes * -1),getdate())
		GROUP BY c.job_id, c.name, jc.expectedduration_minutes

		delete from DBA.dbo.tbl_dba_longrunningjobs
		where lastcheckdate < dateadd(MM,@HistoryInMonds * -1,getdate())
		
		insert into DBA.dbo.tbl_dba_longrunningjobs
		select * from #long_running_jobs

	----------------------------------------------
	-- Sendding alerts and /or creating incidents
	----------------------------------------------
		declare @lastcheckdate datetime;
		declare @job_id uniqueidentifier;
		declare @jobname sysname;
		declare @logindatetime datetime;
		declare @expectedtimeminutes int;
		declare @overtimeminutes int;
		declare @report char(1);
		declare @message varchar(2000)
		declare @subject varchar(50), @body varchar(100)

		declare cu_long_running_jobs cursor for 
		select lrj.lastcheckdate,
				lrj.job_id, 
				lrj.jobname,
				lrj.logindatetime,
				lrj.expectedtimeminutes,
				lrj.overtimeminutes,
				case 
				when lrj.overtimeminutes > jc.alertduration_minutes then
					N'I'
				when lrj.overtimeminutes > jc.expectedduration_minutes then
					N'A'
				else
					N'.'
				end
		from #long_running_jobs lrj
		inner join DBA.dbo.tbl_dba_jobs_config jc
		on lrj.jobname = jc.jobname;
		
	OPEN cu_long_running_jobs;

	FETCH NEXT FROM cu_long_running_jobs 
	INTO @lastcheckdate,
		@job_id,
		@jobname,
		@logindatetime,
		@expectedtimeminutes,
		@overtimeminutes,
		@report;
		
	WHILE @@FETCH_STATUS = 0
	BEGIN
		if (@report = N'I')
		BEGIN
			SELECT @message = N'DBA_Informational: ' + 'LongRunningJobs ' + 'detected: ' + @jobname;
			SET @message = QUOTENAME(@message, '"');
			RAISERROR(@message, 1,1 ) WITH LOG, NOWAIT -- Informational Message 
		END
		ELSE
		BEGIN
			IF (@report = N'A')
			BEGIN
				set  @subject = N'Long running job'
				select @body = N'Job ' + @jobname + ' has been running for ' + convert(varchar,@overtimeminutes) + ' minutes, and was mean to last for ' + convert(varchar, @expectedtimeminutes) + '; Report time: ' + convert(varchar,getdate())
				exec DBA..usp_dba_sendmail N'LONGRUNNINGJOBS', @subject, @body	
			END
		END	

		FETCH NEXT FROM cu_long_running_jobs 
		INTO @lastcheckdate,
			@job_id,
			@jobname,
			@logindatetime,
			@expectedtimeminutes,
			@overtimeminutes,
			@report
	END

	CLOSE cu_long_running_jobs;
	DEALLOCATE cu_long_running_jobs;

	---------------------------
	--Showing Information
	---------------------------
	if upper(@showresult) = N'Y'
		select * from #long_running_jobs;
	---------------------------
	--Dropping temporary tables
	---------------------------

	IF OBJECT_ID(N'[tempdb]..[#enum_job]') IS NOT NULL
		DROP TABLE #enum_job;

	IF OBJECT_ID(N'[tempdb]..[#jobs]') IS NOT NULL
		DROP TABLE #jobs;

	IF OBJECT_ID(N'[tempdb]..[#long_running_jobs]') IS NOT NULL
		DROP TABLE #long_running_jobs;
END 
GO
CREATE PROCEDURE [dbo].[usp_tbl_dba_MSDB_Clean_Up] 
(
	@maxDays int = 30
) with encryption
as 
begin
	SET NOCOUNT ON
	declare @maxDateTime datetime;

	if (@maxDays = null)
		set @maxDays = 30;

	if (@maxDays > 0)
		set @maxDays = @maxDays * -1;

	set @maxDateTime = DATEADD(day, @maxDays, getdate())

	dbcc updateusage (msdb);
	exec msdb.dbo.sp_maintplan_delete_log @oldest_time=@maxDateTime;
	exec msdb.dbo.sp_delete_backuphistory @oldest_date=@maxDateTime;
end
GO
/****** Object:  Table [dbo].[tbl_dba_query_perf_analysis_cpu] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 9/9/2011
-- Description:	The table tbl_dba_query_perf_analysis_CPU will store the top X cpu intensive queries.
--              Would identify query and execution plan in XML Format
--
-- Dependencies: 
--		  Table: 
--    Procedure:
--	  Functions:
-- =============================================
CREATE TABLE [dbo].[tbl_dba_query_perf_analysis_cpu](
	[ID] int IDENTITY(1,1) NOT NULL,
	[statement_text] [nvarchar](max) NULL,
	[query_plan] [xml] NULL,
	[CPU_time] [bigint] NOT NULL,
	[SysInsDate] datetime not null default getdate()
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: July 1, 2010
-- Description:	
-- Dependencies: 
--		  Table: tbl_dba_query_perf_analysis_cpu
--    Procedure:
--	  Functions:
--
-- =============================================
CREATE PROCEDURE [dbo].[usp_dba_query_perf_analysis_cpu]
(
	@pQty int = 10,
	@pMaxQty int = 30,
	@pTruncateTable char(1) = 'Y',
	@pShowRecords char(1) = 'N',
	@pTotal_worker_time bigint = 2000000
)

WITH ENCRYPTION
AS
BEGIN
	SET NOCOUNT ON;
	declare @SQL varchar(max);
	declare @Records int;

	SET @pTruncateTable = UPPER(@pTruncateTable);
	SET @pShowRecords = UPPER(@pShowRecords);

	if (@pTotal_worker_time IS NULL)
		SET @pTotal_worker_time = 2000000;
		
	if (@pTruncateTable = 'Y') or (@pMaxQty <= @pQty) 
		truncate table tbl_dba_query_perf_analysis_cpu;
	else
	begin
		select @Records = count(*) from tbl_dba_query_perf_analysis_cpu;
		if (@Records - (@pMaxQty - @pQty)) > 0
		begin
			SET @Records = @Records - (@pMaxQty - @pQty);

			SET @SQL = 'DELETE FROM tbl_dba_query_perf_analysis_cpu
			WHERE ID IN (SELECT top ' + CAST(@Records as varchar) + ' ID FROM tbl_dba_query_perf_analysis_cpu ORDER BY ID)'
			exec (@SQL);
		end
	end
	
	SET @SQL = '
			INSERT INTO DBA..tbl_dba_query_perf_analysis_cpu(
				[statement_text],
				[query_plan],
				[CPU_time])
			SELECT TOP ' + CAST(@pQty as varchar) + '
				SUBSTRING(b.text, (a.statement_start_offset/2) + 1, ((CASE statement_end_offset
						                                           WHEN -1 THEN DATALENGTH(b.text)
									                               ELSE a.statement_end_offset END - a.statement_start_offset)/2) + 1) AS statement_text,
				c.query_plan,
				a.total_worker_time as CPU_time
			FROM sys.dm_exec_query_stats a  
			CROSS APPLY sys.dm_exec_sql_text (a.sql_handle) AS b  
			CROSS APPLY sys.dm_exec_query_plan (a.plan_handle) AS c  
			WHERE a.total_worker_time > ' + CAST(@pTotal_worker_time as varchar) + ' 
			ORDER BY total_worker_time DESC'
	exec (@SQL);

	if @pShowRecords = 'Y' 
	begin
		SET @SQL = 'SELECT TOP ' + CAST(@pQty as varchar) + ' * from DBA..tbl_dba_query_perf_analysis_cpu order by ID Desc';
		exec (@SQL);
	end
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[tbl_dba_query_perf_analysis_frs] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 9/9/2011
-- Description:	The table tbl_dba_query_perf_analysis_frs will store the top X frequently recompiled statements
--              Identify Queries in cache that have high recompile executions
--
-- Dependencies: 
--		  Table: 
--    Procedure:
--	  Functions:
-- =============================================
CREATE TABLE [dbo].[tbl_dba_query_perf_analysis_frs](
	[ID] int IDENTITY(1,1) NOT NULL,
	[query_text] [nvarchar](max) NULL,
	[plan_generation_num] [bigint] NOT NULL,
	[execution_count] [bigint] NOT NULL,
	[database_name] [nvarchar](128) NULL,
	[object name] [nvarchar](128) NULL,
	[SysInsDate] datetime not null default getdate()
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: July 1, 2010
-- Description:	
-- Dependencies: 
--		  Table: tbl_dba_query_perf_analysis_frs
--    Procedure:
--	  Functions:
--
-- =============================================
CREATE PROCEDURE [dbo].[usp_dba_query_perf_analysis_frs]
(
	@pQty int = 10,
	@pMaxQty int = 30,
	@pTruncateTable char(1) = 'Y',
	@pShowRecords char(1) = 'N',
	@pPlan_generation_num bigint = 1,
	@pExecution_count bigint = 10
)
WITH ENCRYPTION
AS
BEGIN
	SET NOCOUNT ON;
	declare @SQL varchar(max);
	declare @Records int;
	
	SET @pTruncateTable = UPPER(@pTruncateTable);
	SET @pShowRecords = UPPER(@pShowRecords);
	if (@pPlan_generation_num IS NULL)
		SET @pPlan_generation_num = 1;
	if (@pExecution_count IS NULL)
		SET @pExecution_count = 10;

	if (@pTruncateTable = 'Y') or (@pMaxQty <= @pQty) 
		truncate table tbl_dba_query_perf_analysis_frs;
	else
	begin
		select @Records = count(*) from tbl_dba_query_perf_analysis_frs;
		if (@Records - (@pMaxQty - @pQty)) > 0
		begin
			SET @Records = @Records - (@pMaxQty - @pQty);

			SET @SQL = 'DELETE FROM tbl_dba_query_perf_analysis_frs 
			WHERE ID IN (SELECT top ' + CAST(@Records as varchar) + ' ID FROM tbl_dba_query_perf_analysis_frs ORDER BY ID)'
			exec (@SQL);
		end
	end

	SET @SQL = '
			INSERT INTO DBA..tbl_dba_query_perf_analysis_frs(
				[query_text],
				[plan_generation_num],
				[execution_count],
				[database_name],
				[object name])
			SELECT TOP ' + CAST(@pQty as varchar) + '
					b.text AS query_text,        
					plan_generation_num,        
					execution_count,        
					DB_NAME(dbid) AS database_name,        
					OBJECT_NAME(objectid) AS [object name]  
			FROM sys.dm_exec_query_stats a   
			CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS b  
			WHERE a.plan_generation_num > ' + CAST(@pPlan_generation_num as varchar) + ' 
			AND a.execution_count > ' + CAST(@pExecution_count as varchar) + ' 
			ORDER BY plan_generation_num DESC'
	exec (@SQL)
	
	if @pShowRecords = 'Y' 
	begin
		SET @SQL = 'SELECT TOP ' + CAST(@pQty as varchar) + ' * from DBA..tbl_dba_query_perf_analysis_frs order by ID Desc';
		exec (@SQL);
	end
	
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[tbl_dba_query_perf_analysis_io] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 9/9/2011
-- Description:	The table tbl_dba_query_perf_analysis_CPU will store the top X io intensive queries.
--
-- Dependencies: 
--		  Table: 
--    Procedure:
--	  Functions:
-- =============================================
CREATE TABLE [dbo].[tbl_dba_query_perf_analysis_io](
	[ID] int IDENTITY(1,1) NOT NULL,
	[total_logical_reads] [bigint] NOT NULL,
	[total_logical_writes] [bigint] NOT NULL,
	[execution_count] [bigint] NOT NULL,
	[IO_total] [bigint] NULL,
	[query_text] [nvarchar](max) NULL,
	[database_name] [nvarchar](128) NULL,
	[object_id] [int] NULL,
	[SysInsDate] datetime not null default getdate()
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: July 1, 2010
-- Description:	
-- Dependencies: 
--		  Table: tbl_dba_query_perf_analysis_io
--    Procedure:
--	  Functions:
--
-- =============================================
CREATE PROCEDURE [dbo].[usp_dba_query_perf_analysis_io]
(
	@pQty int = 10,
	@pMaxQty int = 30,
	@pTruncateTable char(1) = 'Y',
	@pShowRecords char(1) = 'N',
	@pIO_total bigint = 0,
	@pTotal_logical_reads bigint = 100000 
)
WITH ENCRYPTION
AS
BEGIN
	SET NOCOUNT ON;
	declare @SQL varchar(max);
	declare @Records int;

	SET @pTruncateTable = UPPER(@pTruncateTable);
	SET @pShowRecords = UPPER(@pShowRecords);
	IF @pIO_total IS NULL
		SET @pIO_total = 0;
	IF @pTotal_logical_reads IS NULL
		SET @pTotal_logical_reads = 100000;

	if (@pTruncateTable = 'Y') or (@pMaxQty <= @pQty) 
		truncate table tbl_dba_query_perf_analysis_io;
	else
	begin
		select @Records = count(*) from tbl_dba_query_perf_analysis_io;
		if (@Records - (@pMaxQty - @pQty)) > 0
		begin
			SET @Records = @Records - (@pMaxQty - @pQty);

			SET @SQL = 'DELETE FROM tbl_dba_query_perf_analysis_io
			WHERE ID IN (SELECT top ' + CAST(@Records as varchar) + ' ID FROM tbl_dba_query_perf_analysis_io ORDER BY ID)'
			exec (@SQL);
		end
	end

	SET @SQL = '
			INSERT INTO DBA..tbl_dba_query_perf_analysis_io(
				[total_logical_reads],
				[total_logical_writes],
				[execution_count],
				[IO_total],
				[query_text],
				[database_name],
				[object_id])
			SELECT TOP ' + CAST(@pQty as varchar) + '
				total_logical_reads,         
				total_logical_writes,          
				execution_count,         
				total_logical_reads+total_logical_writes AS [IO_total],         
				b.text AS query_text,         
				db_name(b.dbid) AS database_name,         
				b.objectid AS object_id  

	FROM sys.dm_exec_query_stats  a  
	CROSS APPLY sys.dm_exec_sql_text(sql_handle) b  
	WHERE a.total_logical_reads+a.total_logical_writes > ' + CAST(@pIO_total as varchar) + '   
	AND a.total_logical_reads > ' + CAST(@pTotal_logical_reads as varchar) + ' 
	ORDER BY [IO_total] DESC'
	exec (@SQL)
	
	if @pShowRecords = 'Y'
	begin
		SET @SQL = 'SELECT TOP ' + CAST(@pQty as varchar) + ' * from DBA..tbl_dba_query_perf_analysis_io order by ID Desc';
		exec (@SQL);
	end
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[tbl_dba_query_perf_analysis_io] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 9/9/2011
-- Description:	The table tbl_dba_query_perf_analysis_mii will store the top X missing indexes information
--              Identify queries that may (or may not) be missing indexes based on execution stats
--
-- Dependencies: 
--		  Table: 
--    Procedure:
--	  Functions:
-- =============================================
CREATE TABLE [dbo].[tbl_dba_query_perf_analysis_mii](
	[ID] int IDENTITY(1,1) NOT NULL,
	[statement] nvarchar(4000) NULL,
	[column_id] [int] NULL,
	[column_name] [sysname] NULL,
	[column_usage] varchar(20) NULL,
	[user_seeks] [bigint] NULL,
	[user_scans] [bigint] NULL,
	[last_user_seek] [datetime] NULL,
	[avg_total_user_cost] [float] NULL,
	[avg_user_impact] [float] NULL,
	[SysInsDate] datetime not null default getdate()
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: July 1, 2010
-- Description:	
-- Dependencies: 
--		  Table: tbl_dba_query_perf_analysis_mii
--    Procedure:
--	  Functions:
--
-- =============================================
CREATE PROCEDURE [dbo].[usp_dba_query_perf_analysis_mii]
(
	@pQty int = 10,
	@pMaxQty int = 30,
	@pTruncateTable char(1) = 'Y',
	@pShowRecords char(1) = 'N'
)
WITH ENCRYPTION
AS
BEGIN
	SET NOCOUNT ON;
	declare @SQL varchar(max);
	declare @Records int;

	SET @pTruncateTable = UPPER(@pTruncateTable);
	SET @pShowRecords = UPPER(@pShowRecords);

	if (@pTruncateTable = 'Y') or (@pMaxQty <= @pQty) 
		truncate table tbl_dba_query_perf_analysis_mii;
	else
	begin
		select @Records = count(*) from tbl_dba_query_perf_analysis_mii;
		if (@Records - (@pMaxQty - @pQty)) > 0
		begin
			SET @Records = @Records - (@pMaxQty - @pQty);

			SET @SQL = 'DELETE FROM tbl_dba_query_perf_analysis_mii
			WHERE ID IN (SELECT top ' + CAST(@Records as varchar) + ' ID FROM tbl_dba_query_perf_analysis_mii ORDER BY ID)'
			exec (@SQL);
		end
	end

	SET @SQL = '
			INSERT INTO DBA..tbl_dba_query_perf_analysis_mii(
				[statement],
				[column_id],
				[column_name],
				[column_usage],
				[user_seeks],
				[user_scans],
				[last_user_seek],
				[avg_total_user_cost],
				[avg_user_impact])
			SELECT TOP ' + CAST(@pQty as varchar) + '
				mid.statement AS [database.scheme.table],
				mic.column_id , 
				mic.column_name, 
				mic.column_usage, 
				migs.user_seeks, 
				migs.user_scans, 
				migs.last_user_seek, 
				migs.avg_total_user_cost,
				migs.avg_user_impact
			FROM sys.dm_db_missing_index_details AS mid
			CROSS APPLY sys.dm_db_missing_index_columns (mid.index_handle) as mic
			INNER JOIN sys.dm_db_missing_index_groups AS mig 
			ON mig.index_handle = mid.index_handle
			INNER JOIN sys.dm_db_missing_index_group_stats  AS migs 
			ON mig.index_group_handle=migs.group_handle
			ORDER BY mig.index_group_handle, 
				mig.index_handle, 
				mic.column_id'
	exec (@SQL)
	
	if @pShowRecords = 'Y'
	begin
		SET @SQL = 'SELECT TOP ' + CAST(@pQty as varchar) + ' * from DBA..tbl_dba_query_perf_analysis_mii order by ID Desc';
		exec (@SQL);
	end
	
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dba_archive_dbsize](
	[Database_Name] [varchar](100) NULL,
	[dbid] [varchar](20) NULL,
	[Logical_Filename] [varchar](100) NULL,
	[Filename] [varchar](max) NULL,
	[Size_MB] [decimal](18, 0) NULL,
	[Servername] [varchar](max) NULL,
	[RptDate] [datetime] NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[tbl_dba_archive_Drive_Space](
	[Drive] [char](1) NOT NULL,
	[TotalSizeMB] [numeric](18, 0) NULL,
	[FreeSpaceMB] [numeric](18, 0) NULL,
	[FreeSpacePCT] [numeric](18, 0) NULL,
	[FSDateStamp] [datetime] NULL,
	[ServerName] [varchar](50) NULL,
	[RtpDate] [datetime] NULL CONSTRAINT [DF_tbl_dba_archive_Drive_Space_RtpDate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
CREATE PROCEDURE [dbo].[usp_tbl_dba_archive_drive_space](
@pReturnValues CHAR(1) = N'N',
@pMonths int = 12 --Max number of months in records that will exist in the table
)WITH ENCRYPTION 
AS
BEGIN
	SET NOCOUNT ON;
	IF @pMonths > 1
		SET @pMonths = @pMonths * -1;
		
	IF (@pMonths IS NOT NULL)
		delete from DBA..tbl_dba_archive_Drive_Space
		where [FSDateStamp] < (DATEADD(MM, @pMonths, getdate()))
	
	insert into DBA..tbl_dba_archive_Drive_Space ([Drive], [TotalSizeMB], [FreeSpaceMB], [FreeSpacePCT], [FSDateStamp], [ServerName])
	select [Drive], [TotalSizeMB], [FreeSpaceMB], [FreeSpacePCT], [FSDateStamp], [ServerName] 
	from DBA..tbl_dba_Drive_Space
	
	if @pReturnValues = 'Y' 
		select [Drive], [TotalSizeMB], [FreeSpaceMB], [FreeSpacePCT], [FSDateStamp], [ServerName] from DBA..tbl_dba_Drive_Space
END
GO
CREATE PROCEDURE [dbo].[usp_tbl_dba_archive_dbsize](
@pReturnValues CHAR(1) = N'N',
@pMonths int = 12 --Max number of months in records that will exist in the table
)WITH ENCRYPTION 
AS
BEGIN
	SET NOCOUNT ON;
	IF @pMonths > 1
		SET @pMonths = @pMonths * -1;
		
	IF (@pMonths IS NOT NULL)
		delete from DBA..tbl_dba_archive_dbsize
		where [RptDate] < (DATEADD(MM, @pMonths, getdate()))
	
	insert into DBA.dbo.tbl_dba_archive_dbsize
	select b.name as 'Database_Name', a.dbid, a.name as 'Logical_Filename',
	a.filename, (size*8/1024) as 'Size_MB', @@Servername as 'Servername',
	getdate() as 'RptDate'
	from master..sysaltfiles a, master..sysdatabases b
	where a.dbid=b.dbid
	
	if @pReturnValues = 'Y' 
		select b.name as 'Database_Name', a.dbid, a.name as 'Logical_Filename',
		a.filename, (size*8/1024) as 'Size_MB', @@Servername as 'Servername',
		getdate() as 'RptDate'
		from master..sysaltfiles a, master..sysdatabases b
		where a.dbid=b.dbid
END
GO
use DBA
go
alter table DBA..tbl_dba_maintenance_config
add xAutoFullBackup char(1);
go
update DBA..tbl_dba_maintenance_config
set xAutoFullBackup = N'Y';
go
alter table DBA..tbl_dba_maintenance_config
alter column xAutoFullBackup char(1) not null;
go
alter table DBA..tbl_dba_maintenance_config
add constraint DF_tbl_dba_maintenance_config_xAutoFullBackup default (N'Y') for xAutoFullBackup
go
alter table DBA..tbl_dba_maintenance_config
add xAutoFullBackupSizeThresholdMB int;
go
update DBA..tbl_dba_maintenance_config
set xAutoFullBackupSizeThresholdMB = 100;
go
alter table DBA..tbl_dba_maintenance_config
alter column xAutoFullBackupSizeThresholdMB int not null;
go
alter table DBA..tbl_dba_maintenance_config
add constraint DF_tbl_dba_maintenance_config_xAutoFullBackupSizeThresholdMB default (100) for xAutoFullBackupSizeThresholdMB
go
create procedure databaseSize
(
	@databaseName sysname,
	@size decimal(15,2) output
)with encryption
as 
begin
declare @DataSpaceUsed decimal(15,2);
set @DataSpaceUsed = 0;

if object_id(N'tempdb..#DBSize', N'U') is not null
	drop table #DBSize;
CREATE TABLE #DBSize (SpaceUsed decimal(15,2))
INSERT into #DBSize execute ('use [' + @databaseName + ']
	SELECT SUM(CONVERT(Decimal(15,2),ROUND(FILEPROPERTY(sf.Name,' + '''' + 'SpaceUsed' + '''' + ')/128.000,2))) as SpaceUsed
	FROM dbo.sysfiles sf (NOLOCK) where (Filename like ' + '''' + '%.MDF%' + '''' + ') or (Filename like ' + '''' + '%.NDF%' + '''' + ')');

SELECT @DataSpaceUsed = SpaceUsed from #DBSize
DROP TABLE #DBSize;

set @size = @DataSpaceUsed ;

end
go
alter procedure [dbo].[usp_tbl_dba_log_backup]
(
	@database varchar(100) = NULL,
	@directory varchar(100) = NULL,
    @check char(1) = N'N',
    @execute char(1) = N'N',
    @mkdir char(1) = N'Y'
) with encryption
as
begin
set nocount on
declare @sql2 varchar(5000)
declare @sql varchar(5000),
        @file_name varchar(100),
        @exec_md varchar(500),
        @backupID int,
        @error int 

declare @DBSizeThreshold int;
declare @getAutoFullBackup char(1);
declare @dbSize decimal(15,2);

declare @Compression char(1) = N'N';

if @directory is null select top 1 @directory = db_tran_bkup_location from DBA..tbl_dba_maint_file_location
if right(@directory,1) = N'\' select @directory = @directory + @@servername
else select @directory = @directory + N'\' + @@servername

if @directory is null or len(@directory) < 1
begin
	 raiserror(N'A valid backup location (@directory) must be provided, or set the backup location in DBA..tbl_dba_maint_file_location',16,1)
	 return
end

if @database is not null
begin
	
	if right(@directory,1) <> N'\' set @directory = @directory + N'\'
	
	declare @database_update varchar(500),@string_len int, @database_list varchar(500),@find_semi int, @loop char(1)
	
	select @database_list = @database, @string_len = len(@database_list), @loop = N'N'

	select N'Transaction Log BACKUP' as N'Maintenance_Type',+ SUBSTRING(UPPER(@database),1,50) as N'Target_Database', 
	+ convert(varchar(20),getdate(),9) as N'Date_Time'

	if @execute <> N'Y' select N'SET @execute = ''Y'' ' as N'**To Perform Backup**' 

	select @database_update = replace(@database_list,N',',N';')
	
	while @database_update is not null
	        begin
		  	select @find_semi = patindex (N'%;%',@database_update)--, @sequence = @sequenceloop
			
			 if @find_semi <> 0	  
		         begin
		  	 	select @database = ltrim(rtrim(substring(@database_update,1,(@find_semi - 1))))
			--	
				if (databasepropertyex(@database,N'status') <> N'ONLINE') or (databasepropertyex(@database,N'status') is null)
				begin
					print  N'database : [' + @database + N'] is invalid or database status is not online' 
					select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1)
						,@string_len))
						,@sql = null
						,@loop = N'Y'
					continue
				end

				if (databasepropertyex(@database,N'recovery')=N'simple')
				begin
					print N'log backup is not a valid option for database [' + @database + N'] because it is in simple recovery mode'
					select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1)
						,@string_len))
						,@sql = null
						,@loop = N'Y'
					continue
				end

				--Cheking if the database is primary logshipping, if yes then do not get a backup and the go to next database
				if (DBA.dbo.ufn_dba_IsLogShippingDatabase(@database) = N'Y')
				begin
					print N' '
					print N'database [' + @database + N'] is primary logshipping'                 				
					print N'call logshipping backup job to get a TLog backup'
					select N'***Database Flagged for Logshipping***' AS Logshipping
					UNION ALL
					select N'Call logshipping backup job to get a TLog backup'
						continue	
				end

				set @sql = isnull(@sql,N'') + N'backup log [' + @database + N'] to '

				select @file_name = N'_tlog_' +
			       	convert(char(4),datepart(yy,getdate()) )+
			       	replicate(N'0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
			       	replicate(N'0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
			       	replicate(N'0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
			       	replicate(N'0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
			       	+ N'.trn'
	
				set @sql = @sql + N'disk = ''' + @directory + replace(@database,N' ',N'') + N'\' + replace(@database,N' ',N'') + @file_name + N''''
	
				Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = N'Y' THEN xCompression ELSE N'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database
				
				if @Compression = N'Y'
					select @sql = @sql + N' with compression'
	
				if @execute = N'N'
				begin
					select @sql as N'command to execute'
				end
				else
				begin
					--check if another backup process is running on same database
					if exists(select * from master..sysprocesses (nolock) where dbid = db_id(@database) and cmd like N'backup %')
						begin
							print N'Another backup process is currently running for database ' + @database	
							select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1),@string_len))
							,@sql = null
							,@loop = N'Y'
							continue
						end

					--create backup directory folders
					if @mkdir = N'Y'
					begin
						select @exec_md = N'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,N' ',N'') + N''', no_output'
						exec (@exec_md)
					end
					
					--execute backup log command
					exec (@sql)
				end
				
				select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1),@string_len))
					,@sql = null
					,@loop = N'Y'

				continue
		         end
			else
			begin
				--set @sequence = @sequenceloop 
				
			  	if @loop = N'Y'
                  select @database = @database_update,@sql = null
				
				if (databasepropertyex(@database,N'recovery')=N'simple')
				begin
					print N'log backup is not a valid option for database [' + @database + N'] because it is in simple recovery mode'
				end

				if (databasepropertyex(@database,N'status') <> N'ONLINE') or (databasepropertyex(@database,N'status') is null)
				begin
					print  N'database [' + @database + N'] is invalid or database status is not online' 
				end
				else
				begin

					--Cheking if the database is primary logshipping, if yes then do not get a backup and the go to next database
					if (DBA.dbo.ufn_dba_IsLogShippingDatabase(@database) = N'Y')
					begin
						print N' '
						print N'database [' + @database + N'] is primary logshipping'                 				
						print N'call logshipping backup job to get a TLog backup'
						select N'***Database Flagged for Logshipping***' AS Logshipping
						UNION ALL
						select N'Call logshipping backup job to get a TLog backup'
					end
					else
					begin
						set @sql = isnull(@sql,N'') + N'backup log [' + @database + N'] to '
		
						select @file_name = N'_tlog_' +
				       		convert(char(4),datepart(yy,getdate()) )+
				       		replicate(N'0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
				       		replicate(N'0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
				       		replicate(N'0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
				       		replicate(N'0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
				       		+ N'.trn'
			
						set @sql2 = @sql + N'disk = ''''' + @directory + replace(@database,N' ',N'') + N'\' + replace(@database,N' ',N'') + @file_name + N''''''
						set @sql = @sql + N'disk = ''' + @directory + replace(@database,N' ',N'') + N'\' + replace(@database,N' ',N'') + @file_name + N''''
			
						Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database
					
						if @Compression = N'Y'
							select @sql = @sql + N' with compression'

						if @execute = N'N'
						begin
							--select N'set @execute = ''Y'' ' as '**To Perform Log Backup**'
							select @sql as N'command to execute'
						end
						else
						begin
							--check if another backup process is running on same database
							if exists(select * from master..sysprocesses (nolock) where dbid = db_id(@database) and cmd like 'backup %')
								begin
									print N'Another backup process is currently running for database [' + @database	+ N']'
									select 	 @database_update = ltrim(substring(@database_update,(@find_semi + 1)
									,@string_len))
									,@sql = null
									,@loop = N'Y'
								end

							--create backup directory folders
							if @mkdir = N'Y'
							begin
								select @exec_md = N'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,N' ',N'') + N''', no_output'
								exec (@exec_md)
							end
							
							select @DBSizeThreshold = xAutoFullBackupSizeThresholdMB, @getAutoFullBackup = xAutoFullBackup
							from DBA..tbl_dba_maintenance_config where xdatabase = @database;
							exec databaseSize @databaseName = @database, @size = @dbSize output;

							if (@getAutoFullBackup = N'Y') and (@dbSize <= @DBSizeThreshold) 
							begin
								if object_id(N'tempdb..#tmp_TransactionLogBacup1', N'U') is not null
									drop table #tmp_TransactionLogBacup1;
								create table #tmp_TransactionLogBacup1(OutputText varchar(4000))

								insert into #tmp_TransactionLogBacup1
								execute ('master..xp_cmdshell  ''osql -S' + @@ServerName + ' -E -Q"' + @sql2 + '" -n -h-1 -w1000''')  
								if exists (select 1 from #tmp_TransactionLogBacup1 where OutputText like '%Msg 4214, Level 16, State 1%')
								begin
									exec DBA..usp_tbl_dba_full_backup @database = @database, @execute='Y' 

									if object_id(N'tempdb..#tmp_TransactionLogBacup2', N'U') is not null
										drop table #tmp_TransactionLogBacup2;
									create table #tmp_TransactionLogBacup2(OutputText varchar(4000))

									insert into #tmp_TransactionLogBacup2
									execute ('master..xp_cmdshell  ''osql -S' + @@ServerName + ' -E -Q"' + @sql2 + '" -n -h-1 -w1000''')  
									if exists (select 1 from #tmp_TransactionLogBacup2 where OutputText like '%Msg 4214, Level 16, State 1%')
									begin
										raiserror ('BACKUP LOG cannot be performed because there is no current database backup.', 16,1);
									end
								end
							end
							else
								exec (@sql)
						end
					end
				end
			end
			select @database_update = null
	end		
	--
	set @sql = null
end

if @check <> N'Y'
 if @database is null
  begin
	print N''	 
	print N'
	setting parameter [@check] = ''Y'' will start Transaction Log backup on all database(s) in table DBA..tbl_dba_maintenance_config
	where column name [xlog] has value of ''Y''	'
	return
  end

check_tbl:

if @check = N'N'
return
	--update table tbl_dba_maintenance_config
exec DBA..usp_tbl_dba_maintenance_u
	--
	--display database in tbl_dba_maintenance_config set for Transaction Log Backup
print N' '
select N'***Database Flagged for Backup in tbl_dba_maintenance_config***' = [xdatabase] from DBA..tbl_dba_maintenance_config
where [xlog] <> N'N' and [xskip] <> 1
	--
	--display message
if @execute = N'N'
begin
	select N'set @execute = ''Y'' ' as N'**To Perform Backup**'
end

if right(@directory,1) <> N'\' set @directory = @directory + N'\'

declare cur_db_backup cursor for
	select [xdatabase]
	from DBA..tbl_dba_maintenance_config
	where [xlog] <> N'N'
	and [xskip] <> 1
	
open cur_db_backup
fetch next from cur_db_backup into @database
while @@fetch_status = 0
begin
	
	if (db_id(@database) is null) or (databasepropertyex(@database,'status')<>'ONLINE')
	begin
		print N'log backup error: [' + @database + N']'
	   	print N'database is not online'
        	goto next_db	
	end
	
	if (databasepropertyex(@database,N'recovery')= N'simple')
	begin
		print N' '
		print N'log backup error: [' + @database + N']'
	   	print N'log backup is not a valid option for database [' + @database + N'] because it is in simple recovery mode'
	       	goto next_db	
	end
	
	--Cheking if the database is primary logshipping, if yes then do not get a backup and the go to next database
if (DBA.dbo.ufn_dba_IsLogShippingDatabase(@database) = N'Y')
begin
	print N' '
	print N'database [' + @database + N'] is primary logshipping'                 				
	print N'call logshipping backup job to get a TLog backup'
	select N'***Database Flagged for Logshipping***' AS Logshipping
	UNION ALL
	select N'Call logshipping backup job to get a TLog backup'
		goto next_db	
end

	set @sql = isnull(@sql,N'') + N'backup log [' + @database + N'] to '
		
	select @file_name = N'_tlog_' +
       		convert(char(4),datepart(yy,getdate()) )+
       		replicate(N'0',2 - len(convert(varchar(2),datepart(mm,getdate())))) + convert(varchar(2),datepart(mm,getdate())) +
       		replicate(N'0',2 - len(convert(varchar(2),datepart(dd,getdate())))) + convert(varchar(2),datepart(dd,getdate())) +
       		replicate(N'0',2 - len(convert(varchar(2),datepart(hh,getdate())))) + convert(varchar(2),datepart(hh,getdate())) +
       		replicate(N'0',2 - len(convert(varchar(2),datepart(mi,getdate())))) + convert(varchar(2),datepart(mi,getdate())) +
       		+ N'.trn'
	set @sql2 = @sql + N'disk = ''''' + @directory + replace(@database,N' ',N'') + N'\' + replace(@database,N' ',N'') + @file_name + N''''''
	set @sql = @sql + N'disk = ''' + @directory + replace(@database,N' ',N'') + N'\' + replace(@database,N' ',N'') + @file_name + N''''
	--	
	Select @Compression = CASE WHEN DBA.dbo.uf_dba_CompressionSupported() = 'Y' THEN xCompression ELSE 'N' END FROM DBA.dbo.tbl_dba_maintenance_config where xdatabase = @database
	
	if @Compression = N'Y'
		select @sql = @sql + N' with compression'

	if @execute = N'N'
	begin
	   	select @sql as N'command to execute'
	end
	else	
	begin 	
		--check if another backup process is running on the same database
		if exists(select * from master..sysprocesses (nolock)where dbid = db_id(@database) and cmd like N'backup %')
			begin
				print N'Another backup process is currently running for database ' + @database
				set @sql = null
				goto next_db
			end

		--create backup directory folders
		if @mkdir = N'Y'
		begin
			select @exec_md =  N'exec master..xp_cmdshell ''mkdir ' + @directory + replace(@database,N' ',N'') + N''', no_output'
			exec (@exec_md)
		end
		
		print N' '
		print @database

		select @DBSizeThreshold = xAutoFullBackupSizeThresholdMB, @getAutoFullBackup = xAutoFullBackup
		from DBA..tbl_dba_maintenance_config where xdatabase = @database;
		exec databaseSize @databaseName = @database, @size = @dbSize output;
		
		if (@getAutoFullBackup = N'Y') and (@dbSize <= @DBSizeThreshold) 
		begin
			if object_id(N'tempdb..#tmp_TransactionLogBacup', N'U') is not null
				drop table #tmp_TransactionLogBacup;
			create table #tmp_TransactionLogBacup(OutputText varchar(4000))

			insert into #tmp_TransactionLogBacup
			execute ('master..xp_cmdshell  ''osql -S' + @@ServerName + ' -E -Q"' + @sql2 + '" -n -h-1 -w1000''')  

			if exists (select 1 from #tmp_TransactionLogBacup where OutputText like '%Msg 4214, Level 16, State 1%')
			begin
				exec DBA..usp_tbl_dba_full_backup @database = @database, @execute='Y' 

				if object_id(N'tempdb..#tmp_TransactionLogBacup3', N'U') is not null
					drop table #tmp_TransactionLogBacup3;
				create table #tmp_TransactionLogBacup3(OutputText varchar(4000))

				insert into #tmp_TransactionLogBacup3
				execute ('master..xp_cmdshell  ''osql -S' + @@ServerName + ' -E -Q"' + @sql2 + '" -n -h-1 -w1000''')  
				if exists (select 1 from #tmp_TransactionLogBacup3 where OutputText like '%Msg 4214, Level 16, State 1%')
				begin
					raiserror ('BACKUP LOG cannot be performed because there is no current database backup.', 16,1);
				end
			end
		end
		else
			exec (@sql)
	--
	end
        set @sql = null

next_db:
fetch next from cur_db_backup into @database
end
close cur_db_backup
deallocate cur_db_backup
end
GO
print 'Insert necessary data into TSM configuration table'