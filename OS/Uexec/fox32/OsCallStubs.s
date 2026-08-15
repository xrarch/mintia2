// AUTOMATICALLY GENERATED -- DO NOT EDIT

.section text

OsOpenObject:
.export OsOpenObject
    push fp
    mov  fp, sp

    mov  t0, 0
    int  0x30

    pop  fp
    ret

OsClose:
.export OsClose
    push fp
    mov  fp, sp

    mov  t0, 1
    int  0x30

    pop  fp
    ret

OsReadEvent:
.export OsReadEvent
    push fp
    mov  fp, sp

    mov  t0, 2
    int  0x30

    pop  fp
    ret

OsSignalEvent:
.export OsSignalEvent
    push fp
    mov  fp, sp

    mov  t0, 3
    int  0x30

    pop  fp
    ret

OsResetEvent:
.export OsResetEvent
    push fp
    mov  fp, sp

    mov  t0, 4
    int  0x30

    pop  fp
    ret

OsCreateEvent:
.export OsCreateEvent
    push fp
    mov  fp, sp

    mov  t0, 5
    int  0x30

    pop  fp
    ret

OsCreateJob:
.export OsCreateJob
    push fp
    mov  fp, sp

    mov  t0, 6
    int  0x30

    pop  fp
    ret

OsSignalJob:
.export OsSignalJob
    push fp
    mov  fp, sp

    mov  t0, 7
    int  0x30

    pop  fp
    ret

OsRemoveProcessJob:
.export OsRemoveProcessJob
    push fp
    mov  fp, sp

    mov  t0, 8
    int  0x30

    pop  fp
    ret

OsAddProcessJob:
.export OsAddProcessJob
    push fp
    mov  fp, sp

    mov  t0, 9
    int  0x30

    pop  fp
    ret

OsCreateThread:
.export OsCreateThread
    push fp
    mov  fp, sp

    mov  t0, 10
    int  0x30

    pop  fp
    ret

OsExitThread:
.export OsExitThread
    push fp
    mov  fp, sp

    mov  t0, 11
    int  0x30

    pop  fp
    ret

OsSuspendThread:
.export OsSuspendThread
    push fp
    mov  fp, sp

    mov  t0, 12
    int  0x30

    pop  fp
    ret

OsUnsuspendThread:
.export OsUnsuspendThread
    push fp
    mov  fp, sp

    mov  t0, 13
    int  0x30

    pop  fp
    ret

OsReadStatusThread:
.export OsReadStatusThread
    push fp
    mov  fp, sp

    mov  t0, 14
    int  0x30

    pop  fp
    ret

OsQueryThread:
.export OsQueryThread
    push fp
    mov  fp, sp

    mov  t0, 15
    int  0x30

    pop  fp
    ret

OsSignalThread:
.export OsSignalThread
    push fp
    mov  fp, sp

    mov  t0, 16
    int  0x30

    pop  fp
    ret

OsMaskSignalThread:
.export OsMaskSignalThread
    push fp
    mov  fp, sp

    mov  t0, 17
    int  0x30

    pop  fp
    ret

OsDeliverOnWaitSignalThread:
.export OsDeliverOnWaitSignalThread
    push fp
    mov  fp, sp

    mov  t0, 18
    int  0x30

    pop  fp
    ret

OsGetFaultStatusThread:
.export OsGetFaultStatusThread
    push fp
    mov  fp, sp

    mov  t0, 19
    int  0x30

    pop  fp
    ret

OsSleepThread:
.export OsSleepThread
    push fp
    mov  fp, sp

    mov  t0, 20
    int  0x30

    pop  fp
    ret

OsCreateProcess:
.export OsCreateProcess
    push fp
    mov  fp, sp

    mov  t0, 21
    int  0x30

    pop  fp
    ret

OsSignalProcess:
.export OsSignalProcess
    push fp
    mov  fp, sp

    mov  t0, 22
    int  0x30

    pop  fp
    ret

OsSignalActivationProcess:
.export OsSignalActivationProcess
    push fp
    mov  fp, sp

    mov  t0, 23
    int  0x30

    pop  fp
    ret

OsAwaitActivationProcess:
.export OsAwaitActivationProcess
    push fp
    mov  fp, sp

    mov  t0, 24
    int  0x30

    pop  fp
    ret

OsOpenProcessByPid:
.export OsOpenProcessByPid
    push fp
    mov  fp, sp

    mov  t0, 25
    int  0x30

    pop  fp
    ret

OsReadStatusProcess:
.export OsReadStatusProcess
    push fp
    mov  fp, sp

    mov  t0, 26
    int  0x30

    pop  fp
    ret

OsQueryProcess:
.export OsQueryProcess
    push fp
    mov  fp, sp

    mov  t0, 27
    int  0x30

    pop  fp
    ret

OsQueryProcessByPid:
.export OsQueryProcessByPid
    push fp
    mov  fp, sp

    mov  t0, 28
    int  0x30

    pop  fp
    ret

OsSetGroupProcess:
.export OsSetGroupProcess
    push fp
    mov  fp, sp

    mov  t0, 29
    int  0x30

    pop  fp
    ret

OsSetBasePriorityProcess:
.export OsSetBasePriorityProcess
    push fp
    mov  fp, sp

    mov  t0, 30
    int  0x30

    pop  fp
    ret

OsEnablePrivilegeProcess:
.export OsEnablePrivilegeProcess
    push fp
    mov  fp, sp

    mov  t0, 31
    int  0x30

    pop  fp
    ret

OsDisablePrivilegeProcess:
.export OsDisablePrivilegeProcess
    push fp
    mov  fp, sp

    mov  t0, 32
    int  0x30

    pop  fp
    ret

OsGrantPrivilegeProcess:
.export OsGrantPrivilegeProcess
    push fp
    mov  fp, sp

    mov  t0, 33
    int  0x30

    pop  fp
    ret

OsRevokePrivilegeProcess:
.export OsRevokePrivilegeProcess
    push fp
    mov  fp, sp

    mov  t0, 34
    int  0x30

    pop  fp
    ret

OsExitProcess:
.export OsExitProcess
    push fp
    mov  fp, sp

    mov  t0, 35
    int  0x30

    pop  fp
    ret

OsQueryProcessCount:
.export OsQueryProcessCount
    push fp
    mov  fp, sp

    mov  t0, 36
    int  0x30

    pop  fp
    ret

OsQueryProcesses:
.export OsQueryProcesses
    push fp
    mov  fp, sp

    mov  t0, 37
    int  0x30

    pop  fp
    ret

OsSetQuotaProcess:
.export OsSetQuotaProcess
    push fp
    mov  fp, sp

    mov  t0, 38
    int  0x30

    pop  fp
    ret

OsQueryQuotaProcess:
.export OsQueryQuotaProcess
    push fp
    mov  fp, sp

    mov  t0, 39
    int  0x30

    pop  fp
    ret

OsOpenGroupByPid:
.export OsOpenGroupByPid
    push fp
    mov  fp, sp

    mov  t0, 40
    int  0x30

    pop  fp
    ret

OsSignalGroup:
.export OsSignalGroup
    push fp
    mov  fp, sp

    mov  t0, 41
    int  0x30

    pop  fp
    ret

OsOpenMyGroup:
.export OsOpenMyGroup
    push fp
    mov  fp, sp

    mov  t0, 42
    int  0x30

    pop  fp
    ret

OsNewSessionProcess:
.export OsNewSessionProcess
    push fp
    mov  fp, sp

    mov  t0, 43
    int  0x30

    pop  fp
    ret

