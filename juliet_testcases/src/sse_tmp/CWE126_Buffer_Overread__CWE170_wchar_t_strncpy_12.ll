; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_12_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %data6 = alloca [150 x i32], align 16
  %dest7 = alloca [100 x i32], align 16
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.else, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !18, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !33
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !34
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !37
  %arraydecay3 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !38
  %call4 = call i32* @wcsncpy(i32* %arraydecay2, i32* %arraydecay3, i64 99) #4, !dbg !39
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  call void @printWLine(i32* %arraydecay5), !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data6, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest7, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay8 = getelementptr inbounds [150 x i32], [150 x i32]* %data6, i64 0, i64 0, !dbg !49
  %call9 = call i32* @wmemset(i32* %arraydecay8, i32 65, i64 149) #4, !dbg !50
  %arrayidx10 = getelementptr inbounds [150 x i32], [150 x i32]* %data6, i64 0, i64 149, !dbg !51
  store i32 0, i32* %arrayidx10, align 4, !dbg !52
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest7, i64 0, i64 0, !dbg !53
  %arraydecay12 = getelementptr inbounds [150 x i32], [150 x i32]* %data6, i64 0, i64 0, !dbg !54
  %call13 = call i32* @wcsncpy(i32* %arraydecay11, i32* %arraydecay12, i64 99) #4, !dbg !55
  %arrayidx14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest7, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx14, align 4, !dbg !57
  %arraydecay15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest7, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay15), !dbg !59
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !60
}

declare dso_local i32 @globalReturnsTrueOrFalse(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

declare dso_local void @printWLine(i32*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_12_good() #0 !dbg !61 {
entry:
  call void @good1(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #4, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #4, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_12_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_12_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !84 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %data7 = alloca [150 x i32], align 16
  %dest8 = alloca [100 x i32], align 16
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !88, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !94
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !95
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !98
  %arraydecay3 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !99
  %call4 = call i32* @wcsncpy(i32* %arraydecay2, i32* %arraydecay3, i64 99) #4, !dbg !100
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx5, align 4, !dbg !102
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !103
  call void @printWLine(i32* %arraydecay6), !dbg !104
  br label %if.end, !dbg !105

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data7, metadata !106, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest8, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay9 = getelementptr inbounds [150 x i32], [150 x i32]* %data7, i64 0, i64 0, !dbg !112
  %call10 = call i32* @wmemset(i32* %arraydecay9, i32 65, i64 149) #4, !dbg !113
  %arrayidx11 = getelementptr inbounds [150 x i32], [150 x i32]* %data7, i64 0, i64 149, !dbg !114
  store i32 0, i32* %arrayidx11, align 4, !dbg !115
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest8, i64 0, i64 0, !dbg !116
  %arraydecay13 = getelementptr inbounds [150 x i32], [150 x i32]* %data7, i64 0, i64 0, !dbg !117
  %call14 = call i32* @wcsncpy(i32* %arraydecay12, i32* %arraydecay13, i64 99) #4, !dbg !118
  %arrayidx15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest8, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx15, align 4, !dbg !120
  %arraydecay16 = getelementptr inbounds [100 x i32], [100 x i32]* %dest8, i64 0, i64 0, !dbg !121
  call void @printWLine(i32* %arraydecay16), !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 8, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 27, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 26, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 4800, elements: !25)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !23, line: 74, baseType: !24)
!23 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{!26}
!26 = !DISubrange(count: 150)
!27 = !DILocation(line: 27, column: 21, scope: !19)
!28 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 27, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 27, column: 32, scope: !19)
!33 = !DILocation(line: 29, column: 21, scope: !19)
!34 = !DILocation(line: 29, column: 13, scope: !19)
!35 = !DILocation(line: 30, column: 13, scope: !19)
!36 = !DILocation(line: 30, column: 23, scope: !19)
!37 = !DILocation(line: 33, column: 21, scope: !19)
!38 = !DILocation(line: 33, column: 27, scope: !19)
!39 = !DILocation(line: 33, column: 13, scope: !19)
!40 = !DILocation(line: 35, column: 24, scope: !19)
!41 = !DILocation(line: 35, column: 13, scope: !19)
!42 = !DILocation(line: 37, column: 5, scope: !20)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 41, type: !21)
!44 = distinct !DILexicalBlock(scope: !45, file: !12, line: 40, column: 9)
!45 = distinct !DILexicalBlock(scope: !16, file: !12, line: 39, column: 5)
!46 = !DILocation(line: 41, column: 21, scope: !44)
!47 = !DILocalVariable(name: "dest", scope: !44, file: !12, line: 41, type: !29)
!48 = !DILocation(line: 41, column: 32, scope: !44)
!49 = !DILocation(line: 43, column: 21, scope: !44)
!50 = !DILocation(line: 43, column: 13, scope: !44)
!51 = !DILocation(line: 44, column: 13, scope: !44)
!52 = !DILocation(line: 44, column: 23, scope: !44)
!53 = !DILocation(line: 47, column: 21, scope: !44)
!54 = !DILocation(line: 47, column: 27, scope: !44)
!55 = !DILocation(line: 47, column: 13, scope: !44)
!56 = !DILocation(line: 48, column: 13, scope: !44)
!57 = !DILocation(line: 48, column: 22, scope: !44)
!58 = !DILocation(line: 49, column: 24, scope: !44)
!59 = !DILocation(line: 49, column: 13, scope: !44)
!60 = !DILocation(line: 52, column: 1, scope: !11)
!61 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_12_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 93, column: 5, scope: !61)
!63 = !DILocation(line: 94, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 105, type: !65, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!24, !24, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !12, line: 105, type: !24)
!71 = !DILocation(line: 105, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !12, line: 105, type: !67)
!73 = !DILocation(line: 105, column: 27, scope: !64)
!74 = !DILocation(line: 108, column: 22, scope: !64)
!75 = !DILocation(line: 108, column: 12, scope: !64)
!76 = !DILocation(line: 108, column: 5, scope: !64)
!77 = !DILocation(line: 110, column: 5, scope: !64)
!78 = !DILocation(line: 111, column: 5, scope: !64)
!79 = !DILocation(line: 112, column: 5, scope: !64)
!80 = !DILocation(line: 115, column: 5, scope: !64)
!81 = !DILocation(line: 116, column: 5, scope: !64)
!82 = !DILocation(line: 117, column: 5, scope: !64)
!83 = !DILocation(line: 119, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 61, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !84, file: !12, line: 61, column: 8)
!87 = !DILocation(line: 61, column: 8, scope: !84)
!88 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 64, type: !21)
!89 = distinct !DILexicalBlock(scope: !90, file: !12, line: 63, column: 9)
!90 = distinct !DILexicalBlock(scope: !86, file: !12, line: 62, column: 5)
!91 = !DILocation(line: 64, column: 21, scope: !89)
!92 = !DILocalVariable(name: "dest", scope: !89, file: !12, line: 64, type: !29)
!93 = !DILocation(line: 64, column: 32, scope: !89)
!94 = !DILocation(line: 66, column: 21, scope: !89)
!95 = !DILocation(line: 66, column: 13, scope: !89)
!96 = !DILocation(line: 67, column: 13, scope: !89)
!97 = !DILocation(line: 67, column: 23, scope: !89)
!98 = !DILocation(line: 70, column: 21, scope: !89)
!99 = !DILocation(line: 70, column: 27, scope: !89)
!100 = !DILocation(line: 70, column: 13, scope: !89)
!101 = !DILocation(line: 71, column: 13, scope: !89)
!102 = !DILocation(line: 71, column: 22, scope: !89)
!103 = !DILocation(line: 72, column: 24, scope: !89)
!104 = !DILocation(line: 72, column: 13, scope: !89)
!105 = !DILocation(line: 74, column: 5, scope: !90)
!106 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 78, type: !21)
!107 = distinct !DILexicalBlock(scope: !108, file: !12, line: 77, column: 9)
!108 = distinct !DILexicalBlock(scope: !86, file: !12, line: 76, column: 5)
!109 = !DILocation(line: 78, column: 21, scope: !107)
!110 = !DILocalVariable(name: "dest", scope: !107, file: !12, line: 78, type: !29)
!111 = !DILocation(line: 78, column: 32, scope: !107)
!112 = !DILocation(line: 80, column: 21, scope: !107)
!113 = !DILocation(line: 80, column: 13, scope: !107)
!114 = !DILocation(line: 81, column: 13, scope: !107)
!115 = !DILocation(line: 81, column: 23, scope: !107)
!116 = !DILocation(line: 84, column: 21, scope: !107)
!117 = !DILocation(line: 84, column: 27, scope: !107)
!118 = !DILocation(line: 84, column: 13, scope: !107)
!119 = !DILocation(line: 85, column: 13, scope: !107)
!120 = !DILocation(line: 85, column: 22, scope: !107)
!121 = !DILocation(line: 86, column: 24, scope: !107)
!122 = !DILocation(line: 86, column: 13, scope: !107)
!123 = !DILocation(line: 89, column: 1, scope: !84)
