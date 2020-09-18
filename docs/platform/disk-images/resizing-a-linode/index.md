---
author:
  name: Linode
  email: docs@linode.com
description: Our guide to upgrading and resizing your Linode
keywords: ["upgrading", "resizing", "disk space"]
tags: ["linode platform","cloud manager"]
license: '[CC BY-ND 4.0](https://creativecommons.org/licenses/by-nd/4.0)'
aliases: ['/platform/disk-images/resizing-a-linode-classic-manager/','/resizing/','/migrate-to-linode/disk-images/resizing-a-linode/']
modified: 2019-03-28
modified_by:
  name: Linode
published: 2017-02-14
title: Resizing a Linode
---

We make it easy to upgrade or downgrade your Linode by changing plans and adding additional resources. If you're expecting a temporary burst of traffic to your website, or if you're not using your Linode as much as you thought, you can temporarily or permanently resize your Linode to a different plan.

![Resizing a Linode](resizing_a_linode.png "Resizing a Linode")

{{< note >}}
Linodes can be resized to a smaller or larger plan. A [Shared](https://www.linode.com/products/shared) plan can also be converted to a [High Memory](https://www.linode.com/pricing/) plan, or vice versa.
{{< /note >}}

## Resizing Your Linode

You can move your Linode from one plan to another by using the *resize* feature. To complete the resizing process, **your Linode will be powered off** and migrated to a different host in the same data center. Your data, configuration profiles, and IP addresses will all be moved to the new host. Please note that the migration will take approximately 1 minute for every 3-5 gigabytes of data.

{{< note >}}
If you're downgrading your plan, verify that your disks are using less space than the new plan provides. For more information, see our documentation on [resizing a disk](/docs/platform/disk-images/disk-images-and-configuration-profiles/#resizing-a-disk).
{{< /note >}}

Here's how to resize your Linode:

1.  Log in to the [Linode Manager](https://cloud.linode.com).
1.  Click the **Linodes** link in the sidebar.
1.  Select a Linode from the list.
1.  Click the **Resize** tab. The webpage shown below appears.

    [![The Linode resize page.](resize-tab.png)](resize-tab.png)

1.  You can automatically resize your primary disk by selecting the **Auto Resize Disk** checkbox.

    {{< note >}}
Automatic resizing is only available when moving to a larger plan, and when you have a single ext disk (or one ext and one swap disk) on your Linode.
    {{< /note >}}

    [![Automatically resize your main disk by checking the resize checkbox.](resize-auto-checkbox.png)](resize-auto-checkbox.png)

1.  Select a plan and click the **Submit** button. Your Linode will be powered off and moved to another host. Depending on the size of your Linode, this process can take up to one hour.

1.  (Optional) When the migration completes, check your disk storage allocation meter. If you resized your Linode to a larger plan and the main disk was not automatically resized, you'll have additional un-used storage to allocate to your disks. You may want to add some of this storage to one of your disks if the internal filesystem on it is running low on free space, or just so you can use it in the future.

    Navigate to your Linode's **Disks/Config** tab to view your disk storage allocation meter. Click on the **More Options Ellipses** link (...) next to the disk you'd like to allocate the extra storage to and select **Resize**.

    [![View your disk storage allocator](disk-allocator.png "View your disk storage allocator")](disk-allocator.png)

    The *Resize Disk* panel will appear. In the **Size** field, enter a new size in the specified range and click **Resize**.

    [![Resize your disk](resize-disk.png "Resize your disk")](resize-disk.png)

1.  Once completed, your Linode will still be powered off. Scroll to the top of the page and click on the **Offline** button and select **Power On**.

Your Linode has been successfully resized and migrated to the new host.
