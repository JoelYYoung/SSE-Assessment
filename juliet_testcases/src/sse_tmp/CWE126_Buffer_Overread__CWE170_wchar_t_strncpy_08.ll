; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %call = call i32 @staticReturnsTrue(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.end, !dbg !17

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

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_08_good() #0 !dbg !44 {
entry:
  call void @good1(), !dbg !45
  call void @good2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #4, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #4, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_08_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_08_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !68 {
entry:
  ret i32 1, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !72 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %call = call i32 @staticReturnsFalse(), !dbg !73
  %tobool = icmp ne i32 %call, 0, !dbg !73
  br i1 %tobool, label %if.then, label %if.else, !dbg !75

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  br label %if.end, !dbg !78

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !79, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !85
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !86
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !89
  %arraydecay3 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !90
  %call4 = call i32* @wcsncpy(i32* %arraydecay2, i32* %arraydecay3, i64 99) #4, !dbg !91
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !92
  store i32 0, i32* %arrayidx5, align 4, !dbg !93
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !94
  call void @printWLine(i32* %arraydecay6), !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !97 {
entry:
  ret i32 0, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !99 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %call = call i32 @staticReturnsTrue(), !dbg !100
  %tobool = icmp ne i32 %call, 0, !dbg !100
  br i1 %tobool, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !103, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !109
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !110
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %arraydecay3 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !114
  %call4 = call i32* @wcsncpy(i32* %arraydecay2, i32* %arraydecay3, i64 99) #4, !dbg !115
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx5, align 4, !dbg !117
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  call void @printWLine(i32* %arraydecay6), !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 37, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 8)
!17 = !DILocation(line: 37, column: 8, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 40, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 39, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 38, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 4800, elements: !25)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !23, line: 74, baseType: !24)
!23 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{!26}
!26 = !DISubrange(count: 150)
!27 = !DILocation(line: 40, column: 21, scope: !19)
!28 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 40, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 40, column: 32, scope: !19)
!33 = !DILocation(line: 42, column: 21, scope: !19)
!34 = !DILocation(line: 42, column: 13, scope: !19)
!35 = !DILocation(line: 43, column: 13, scope: !19)
!36 = !DILocation(line: 43, column: 23, scope: !19)
!37 = !DILocation(line: 46, column: 21, scope: !19)
!38 = !DILocation(line: 46, column: 27, scope: !19)
!39 = !DILocation(line: 46, column: 13, scope: !19)
!40 = !DILocation(line: 48, column: 24, scope: !19)
!41 = !DILocation(line: 48, column: 13, scope: !19)
!42 = !DILocation(line: 50, column: 5, scope: !20)
!43 = !DILocation(line: 51, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_08_good", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 102, column: 5, scope: !44)
!46 = !DILocation(line: 103, column: 5, scope: !44)
!47 = !DILocation(line: 104, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 115, type: !49, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!24, !24, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 115, type: !24)
!55 = !DILocation(line: 115, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 115, type: !51)
!57 = !DILocation(line: 115, column: 27, scope: !48)
!58 = !DILocation(line: 118, column: 22, scope: !48)
!59 = !DILocation(line: 118, column: 12, scope: !48)
!60 = !DILocation(line: 118, column: 5, scope: !48)
!61 = !DILocation(line: 120, column: 5, scope: !48)
!62 = !DILocation(line: 121, column: 5, scope: !48)
!63 = !DILocation(line: 122, column: 5, scope: !48)
!64 = !DILocation(line: 125, column: 5, scope: !48)
!65 = !DILocation(line: 126, column: 5, scope: !48)
!66 = !DILocation(line: 127, column: 5, scope: !48)
!67 = !DILocation(line: 129, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !69, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!24}
!71 = !DILocation(line: 25, column: 5, scope: !68)
!72 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 60, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !72, file: !12, line: 60, column: 8)
!75 = !DILocation(line: 60, column: 8, scope: !72)
!76 = !DILocation(line: 63, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !12, line: 61, column: 5)
!78 = !DILocation(line: 64, column: 5, scope: !77)
!79 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 68, type: !21)
!80 = distinct !DILexicalBlock(scope: !81, file: !12, line: 67, column: 9)
!81 = distinct !DILexicalBlock(scope: !74, file: !12, line: 66, column: 5)
!82 = !DILocation(line: 68, column: 21, scope: !80)
!83 = !DILocalVariable(name: "dest", scope: !80, file: !12, line: 68, type: !29)
!84 = !DILocation(line: 68, column: 32, scope: !80)
!85 = !DILocation(line: 70, column: 21, scope: !80)
!86 = !DILocation(line: 70, column: 13, scope: !80)
!87 = !DILocation(line: 71, column: 13, scope: !80)
!88 = !DILocation(line: 71, column: 23, scope: !80)
!89 = !DILocation(line: 74, column: 21, scope: !80)
!90 = !DILocation(line: 74, column: 27, scope: !80)
!91 = !DILocation(line: 74, column: 13, scope: !80)
!92 = !DILocation(line: 75, column: 13, scope: !80)
!93 = !DILocation(line: 75, column: 22, scope: !80)
!94 = !DILocation(line: 76, column: 24, scope: !80)
!95 = !DILocation(line: 76, column: 13, scope: !80)
!96 = !DILocation(line: 79, column: 1, scope: !72)
!97 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !69, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 30, column: 5, scope: !97)
!99 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocation(line: 84, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !99, file: !12, line: 84, column: 8)
!102 = !DILocation(line: 84, column: 8, scope: !99)
!103 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 87, type: !21)
!104 = distinct !DILexicalBlock(scope: !105, file: !12, line: 86, column: 9)
!105 = distinct !DILexicalBlock(scope: !101, file: !12, line: 85, column: 5)
!106 = !DILocation(line: 87, column: 21, scope: !104)
!107 = !DILocalVariable(name: "dest", scope: !104, file: !12, line: 87, type: !29)
!108 = !DILocation(line: 87, column: 32, scope: !104)
!109 = !DILocation(line: 89, column: 21, scope: !104)
!110 = !DILocation(line: 89, column: 13, scope: !104)
!111 = !DILocation(line: 90, column: 13, scope: !104)
!112 = !DILocation(line: 90, column: 23, scope: !104)
!113 = !DILocation(line: 93, column: 21, scope: !104)
!114 = !DILocation(line: 93, column: 27, scope: !104)
!115 = !DILocation(line: 93, column: 13, scope: !104)
!116 = !DILocation(line: 94, column: 13, scope: !104)
!117 = !DILocation(line: 94, column: 22, scope: !104)
!118 = !DILocation(line: 95, column: 24, scope: !104)
!119 = !DILocation(line: 95, column: 13, scope: !104)
!120 = !DILocation(line: 97, column: 5, scope: !105)
!121 = !DILocation(line: 98, column: 1, scope: !99)
