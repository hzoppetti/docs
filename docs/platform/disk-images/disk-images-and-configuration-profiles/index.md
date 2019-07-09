---
author:
  name: Linode
  email: docs@linode.com
description: Our guide to disks and configuration profiles
keywords: ["disks", "config profiles", "disk space"]
license: '[CC BY-ND 4.0](https://creativecommons.org/licenses/by-nd/4.0)'
aliases: ['disk-images-config-profiles/','migrate-to-linode/disk-images/disk-images-and-configuration-profiles/']
modified: 2019-03-13
modified_by:
  name: Linode
published: 2012-04-24
title: Disks and Configuration Profiles
classic_manager_link: 'platform/disk-images/disk-images-and-configuration-profiles-classic-manager/'
external_resources:
  - '[Types of File Systems](https://en.wikipedia.org/wiki/File_system#Types_of_file_systems)'
---

The Linode Cloud Manager allows you to create, edit, and use disks and configuration profiles with your Linodes. You can install different Linux distributions on the disks, set device assignments, and configure boot settings. This guide will show you how to put the pieces together to create a custom setup.

## Getting Started

Your Linode plan comes with persistent storage to hold your most important asset - data. This pool of storage can be broken up into individual containers called *disks*. It's easy to create, resize, and delete disks.

A *configuration profile* is a boot loader for your Linode. It controls general boot settings, including the disk your Linode will start up from, the disks that will be mounted, and the kernel that will be used. You can create multiple configuration profiles and store them in the Linode Cloud Manager.

[![Overview of disks and configuration profiles.](1740-disk-images1.png)](1740-disk-images1.png)

The Linode Cloud Manager automatically creates a disk and configuration profile when you create a Linode, but you can manually create as many as you want, provided you have the storage space available. The space for disks is allocated from your [Linode plan's](https://www.linode.com/pricing) storage size. You can allocate all available storage to one disk, or you can create multiple disks, as shown in the diagram above.

### Finding Your Way Around

All of a Linode's disks and configuration profiles are displayed on the Linode's detail page, under the **Advanced**.

[![Overview of Linode Manager interface.](disks-and-config-profiles-advanced-options.png)](disks-and-config-profiles-advanced-options.png)

1.  Your configuration profiles are listed in the **Configuration** table. Click on the **more options ellipsis** corresponding to a profile and then select **Boot This Config** from the dropdown menu that appears to boot your Linode under that configuration profile.

1.  Click the **Add a Configuration** link to create a new configuration profile.

1.  Your disks are listed in the **Disks** table. Select the corresponding **more options ellipsis** to resize, rename, imagize, or delete a disk.

1.  Click the **Add a Disk** link to create a new blank disk, or a disk with a Linux distribution installed.

1.  This pane indicates how much of your plan's available storage has been allocated to your disks. This does not represent how much disk space is available on any given disk that you've created. To see how much space inside your disk is currently being used, connect to your Linode via SSH and execute the `df -h` command.

## Disks

Just like how your desktop computer has a physical hard drive that can be partitioned into smaller virtual drives, your Linode plan's storage space can be split into disks. Disks can be used to store anything, including files, applications, or other Linux distributions. The space allocated to disks draws from your plan's available storage space.

### Creating a Disk with a Linux Distribution Installed

The Linode Cloud Manager makes it easy to create a new disk with a fresh Linux distribution installed. This is a fast and easy way to try out other distributions. Here's how to create a disk with a Linux distribution installed:

1.  Log in to the [Linode Cloud Manager](https://cloud.linode.com).
2.  Click the **Linodes** link in the sidebar.
3.  Select a Linode. The Linode's detail page appears.
4.  Click on the **Advanced** tab.
5.  Click on **Add a Disk**. The **Add Disk** form appears:

    [![The 'Add Disk' menu.](disks-and-config-profiles-add-a-disk-image.png)](disks-and-config-profiles-add-a-disk-image.png)

6.  Select **Create from Image**.
7.  Provide a label for your disk.
8.  Select a Linux distribution from the **Image** menu.
9.  Enter a password for the `root` user in the **Root Password** field.
10. Enter a size for the disk in the **Size** field. The size must be smaller than the amount of storage space remaining in your Linode plan.
11. Click **Add**.

The disk will be created. Monitor your bell notifications at the top of the Cloud Manager for progress updates on your new disk's creation. You'll need to create or modify a configuration profile to mount the new disk. For instructions, see [Configuration Profiles](#configuration-profiles).

### Creating a Blank Disk

Create a blank disk if you need detachable storage space or want to download and install your own Linux distribution. Here's how:

1.  Log in to the [Linode Cloud Manager](https://cloud.linode.com).
1.  Click the **Linodes** link in the sidebar.
1.  Select a Linode. The Linode's detail page appears.
2.  Click on the **Advanced** tab.
3.  Click on **Add a Disk**. The **Add Disk** form appears:

    [![The 'Add Disk' menu.](disks-and-config-profiles-add-blank-disk.png)](disks-and-config-profiles-add-blank-disk.png)

4.  Enter a name for the disk in the **Label** field.
5.  By default, **Filesystem** is set to `ext4`. We recommend that you stick with this setting.
6.  Enter a size for the disk in the **Size** field. The size must be smaller than the amount of storage space remaining in your Linode plan.
7.  Click **Add**.

The disk will be created. Monitor your bell notifications at the top of the Cloud Manager for progress updates on your new disk's creation. You'll need to create or modify a configuration profile to mount the new disk. For instructions, see [Configuration Profiles](#configuration-profiles).

### Resizing a Disk

Resizing allows you to allocate more storage to a disk so you can store more files on it, or shrink a disk so you have more allocatable space for the other disks.

{{< note >}}
Resizing a disk requires you to power your Linode off, if it is currently in use by your Linode. Shrinking a disk takes longer than increasing its size.
{{< /note >}}

1.  Log in to the [Linode Cloud Manager](https://cloud.linode.com).
2.  Click the **Linodes** link in the sidebar.
3.  Select a Linode. The Linode's detail page appears.
4.  Select **Power Off** from the status dropdown menu to turn your Linode off. Monitor the progress bar at the top of the page for confirmation that your Linode has powered off.
5.  Click on the **Advanced** tab.
6.  Click the **more options ellipsis** for the disk you would like to resize, and select **Resize**. The **Resize Disk** form appears.

    [![Resize a disk.](disks-and-config-profiles-resize-a-disk.png)](disks-and-config-profiles-resize-a-disk.png)

7.  In the **Size** field, enter a different size for the disk in megabytes. The maximum size available is shown beneath the field.
8.  Click **Resize**. A progress bar will appear at the top of the page.
9.  When resizing is complete, select **Power On** from the status menu to turn on the Linode. You have successfully resized the disk.

<!--### Duplicating a Disk

{{< note >}}
Duplicating a disk is not yet available in the Cloud Manager, but this feature is available in the Classic Manager. See [the Classic Manager version of this guide](/docs/platform/disk-images/disk-images-and-configuration-profiles-classic-manager/#duplicating-a-disk) for instructions on how to duplicate a disk.
{{</ note >}}

You can create an exact copy of a disk by duplicating it. This is an effective way to back up your server or clone an existing Linode to a new Linode. (To clone a disk, see [Cloning disks and Configuration Profiles](#cloning-disks-and-configuration-profiles).) Here's how to duplicate a disk:

1.  Log in to the [Linode Manager](https://manager.linode.com).
1.  Click the **Linodes** tab.
1.  Select a Linode. The Linode's dashboard appears.
1.  Click **Shut down** to turn your Linode off. Watch the *Host Job Queue* for confirmation that the Linode has shut down.
1.  Select the disk you want to duplicate. The *Edit disk* webpage appears.
1.  Click **Duplicate Disk**. The Linode's dashboard appears. Watch the *Host Job Queue* for confirmation that the disk has been duplicated.
1.  Click **Boot** to turn on the Linode.

The disk will be duplicated. Watch the *Host Job Queue* on the Dashboard to monitor the progress. When the process is complete, the disk will appear on the dashboard.
-->

### Removing a Disk

You can delete a disk to remove it from your Linode and reallocate its storage space to another disk. Here's how to delete a disk:

{{< caution >}}
Removing a disk is permanent and cannot be undone.
{{</ caution >}}

1.  Log in to the [Linode Cloud Manager](https://cloud.linode.com).
2.  Click the **Linodes** link in the sidebar.
3.  Select a Linode. The Linode's detail page appears.
4.  Click **Power Off** from the status menu to turn your Linode off. Monitor the progress bar at the top of the page for confirmation that your Linode has powered off.
5.  Click on the **Advanced** tab.
6.  Click on the **more options ellipsis** next to the disk you would like to delete and select **Delete**. Monitor your bell notifications for updates on the deletion of your disk.
7.  Click **Power On** from the status menu to turn on the Linode.

The disk will be deleted. The storage space the disk was using is now available to other disks.

## Configuration Profiles

A Linode's configuration profiles are similar to [GNU GRUB](http://en.wikipedia.org/wiki/GNU_GRUB), the Linux boot loader that allows you to select and boot from an operating system installed on your desktop computer. You can create different configuration profiles to build boot configurations with custom disks, kernels, and OS run level settings.

### Creating a Configuration Profile

Making a new configuration profile allows you to create a new and separate boot configuration for your system. You can specify boot settings and disks to mount. Here's how to create a new configuration profile:

1.  Log in to the [Linode Cloud Manager](https://cloud.linode.com).
2.  Click the **Linodes** link from the sidebar.
3.  Select a Linode. The Linode's detail page appears.
4.  Click on the **Advanced** tab.
5.  Select the **Add a Configuration** link. The **Add Linode Configuration** form appears:

    [![The Add Linode Configuration menu.](disks-and-config-profiles-add-a-config.png)](disks-and-config-profiles-add-a-config.png)

6.  Enter a descriptive name for the configuration profile in the **Label** field. This name appears on the Linode's detail page and will help you differentiate it from other configuration profiles.
7.  You can enter comments or notes about this configuration profile in the **Comments** field.
8.  Under **VM Mode**, select whether you would like paravirtualization or full-virtualization. This option describes how hardware commands are directed to the host operating system. Paravirtualization is recommended, and is necessary for features like [Block Storage](/docs/platform/block-storage/how-to-use-block-storage-with-your-linode/).
9.  Select a Linux kernel from the **Kernel** menu. We recommend selecting one of the current and latest kernels.
10. Select the **Run Level** for your configuration profile. If you aren't sure which level to choose, choose **Run Default Level**.
11. Set the **Memory Limit** for the configuration profile. The maximum amount of available memory is displayed below the text field.
12. In the **Block Device Assignment** section, select a bootable disk, a swap disk (optional), and any other disks that you would like to mount at start up.
13. Select a bootable disk from the **Root Device** menu.
14. Leave the settings in the **Filesystem/Boot Helpers** section alone, unless you have a specific reason to change them.
15. Click **Submit**.

The configuration profile will be created and will appear on the Linode's detail page.

### Editing a Configuration Profile

You can edit existing configuration profiles to change boot settings, set other disks to mount, and more. Here's how to edit a configuration profile:

1.  Log in to the [Linode Cloud Manager](https://cloud.linode.com).
2.  Click the **Linodes** link from the sidebar.
3.  Select a Linode. The Linode's detail page appears.
4.  Click on the **Advanced** tab.
5.  Click the configuration profile's **more options ellipsis** and select **Edit**. The **Edit Linode Configuration** form appears.
6.  Edit the settings as necessary.
7.  When finished, click **Submit**.

The changes to the configuration profile have been saved. You may need to reboot your Linode to activate the changes.

### Selecting and Using a Configuration Profile

You can create and store many different configuration profiles in the Linode Manager, but you can only boot your Linode from one configuration profile at a time. Here's how to select a configuration profile and boot your Linode from it:

1.  Log in to the [Linode Cloud Manager](https://cloud.linode.com).
2.  Click the **Linodes** link from the sidebar.
3.  Select a Linode. The Linode's detail page appears.
4.  Click on the **Advanced** tab.
5.  Click the more options ellipsis for the configuration profile you would like to boot from:

    [![Selecting a configuration profile](disks-and-config-profiles-boot-this-config.png)](disks-and-config-profiles-boot-this-config.png)

6.  Select **Boot This Config**. Monitor the progress bar at the top of the page as your Linode boots with your selected profile.

You have successfully selected and booted your Linode from a configuration profile.

### Removing a Configuration Profile

You can remove a configuration profile from the Linode Cloud Manager at any time. Here's how:

1.  Log in to the [Linode Cloud Manager](https://manager.linode.com).
2.  Click the **Linodes** link from the sidebar.
3.  Select a Linode. The Linode's detail page appears.
4.  Click on the **Advanced** tab.
5.  Click the **more options ellipsis** for the configuration profile you would like to remove.
6.  Select the **Delete** option from the dropdown menu that appears.

The configuration profile is removed from the Linode detail page.

## Cloning Disks and Configuration Profiles

You can *clone* disks and configuration profiles from one Linode to another, as long as both of the Linodes are on your account. This is an easy way to transfer your configuration between Linodes. To clone an entire Linode, which is an easy way to migrate your Linode to a different data center, see our [Clone Your Linode guide](docs/platform/disk-images/clone-your-linode/).

{{< note >}}
We recommend that you power off your Linode first, and keep it powered off until the disk has finished being cloned.
{{< /note >}}

1.  Log in to the [Linode Cloud Manager](https://manager.linode.com).

1.  Click the **Linodes** link from the sidebar.

1.  Select a Linode. The Linode's detail page appears.

1.  Click on the **Advanced** tab.

1.  Click the **more options ellipsis** for the Linode's disk you wish to clone.

1.  Select the **Clone** option from the dropdown menu that appears.

    [![Select Clone Option On A Disk](disks-and-config-menu-clone.png)](disks-and-config-menu-clone.png)

1.  On this page you can chose which disks and configuration profiles you wish to clone by checking their boxes. Click the **Disks** tab to see and select those. As you make selections you will see them appear on the right panel below the word **Selected**.

    [![Select a Disk to Clone](disks-and-config-select-disks.png)](disks-and-config-select-disks.png)

    Click the **Configuration Profiles** tab to see and select those. As you make selections you will see them appear on the right panel below the word **Selected**.

    [![Select a Configuration Profile to Clone](disks-and-config-select-profile.png)](disks-and-config-select-profile.png)

    If you select a profile, all the disks associated with that profile will automatically be selected.

    [![Selecting a Configuration Profile Selects All Disks](disks-and-config-profile-selects-all.png)](disks-and-config-profile-selects-all.png)

1.  On the right select the Destination Linode for your clone. If you've selected individual disks, you can select the current Linode or any other Linode on your account. If you've selected a configuration profile you cannot select the current Linode, but you can select any other Linode on your account.

    [![Select a Destination Linode](disks-and-config-select-linode.png)](disks-and-config-select-linode.png)

    If you previously selected the current Linode and then selected a configuration profile, the Clone button will become disabled until you select a new Linode.

    [![Clone Button is Disabled for Configuration Profile to Same Linode](disks-and-config-clone-disabled.png)](disks-and-config-clone-disabled.png)

1.  Click the **Clone** button to begin the cloning process.
    [![Click the Clone Button](disks-and-config-clone-button.png)](disks-and-config-clone-button.png)

    If your destination Linode is not big enough for your copy, you will get a warning.
    [![Size Error Message](disks-and-config-size-error.png)](disks-and-config-size-error.png)

    {{< note >}}
If you need to make room on your destination Linode you can resize it to be larger, or delete disks. If you need to resize it, be sure to uncheck the box that automatically resizes the disks or they will expand to fill up the extra space that you are trying to create.
{{< /note >}}

1.  Once the clone process begins, you are returned to the **Advanced** tab and a progress bar appears at the top of the screen.
    [![Copying Progress Bar](disks-and-config-status-bar.png)](disks-and-config-status-bar.png)

1.  When the copy is complete, your new disk or configuration appears in the panel on the **Advanced** page.
    [![Disk Copying Complete](disks-and-config-clone-complete.png)](disks-and-config-clone-complete.png)

## Potential Uses

If you're wondering how you could use disks and configuration profiles, here are some ideas to get you started:

-   **Automate Server Builds:** If you run a large website that requires multiple servers, or if you just love automating things, you'll want to [automate your server builds](/docs/platform/automating-server-builds/). You can rapidly spin up multiple servers with exactly the same configuration by creating a *golden disk* that can be cloned to multiple Linodes.
-   **Experiment with Distributions:** New to Linux? Take different distributions out for a spin by creating a separate disk for each flavor of Linux. Once you find a distribution you like, you can delete all of the disks except the one with your favorite distribution.
-   **Create a Software Testing Environment:** If you're a developer, you can create different disks for testing purposes. Every disk can hold a different 32- or 64-bit distribution, and every configuration profile can be set to use a different kernel. Even if you're not a developer, this is ideal for testing open source or proprietary software on different distributions.
