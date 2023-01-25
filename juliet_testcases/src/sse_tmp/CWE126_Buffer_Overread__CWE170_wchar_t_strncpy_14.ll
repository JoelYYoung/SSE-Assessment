; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_14.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @globalFive, align 4, !dbg !15
  %cmp = icmp eq i32 %0, 5, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !18

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !19, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !35
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !39
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !40
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !41
  call void @printWLine(i32* %arraydecay4), !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_14_good() #0 !dbg !45 {
entry:
  call void @good1(), !dbg !46
  call void @good2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #4, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #4, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_14_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_14_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !69 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @globalFive, align 4, !dbg !70
  %cmp = icmp ne i32 %0, 5, !dbg !72
  br i1 %cmp, label %if.then, label %if.else, !dbg !73

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  br label %if.end, !dbg !76

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !77, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !83
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !84
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !88
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !89
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx4, align 4, !dbg !91
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !92
  call void @printWLine(i32* %arraydecay5), !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !95 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @globalFive, align 4, !dbg !96
  %cmp = icmp eq i32 %0, 5, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !100, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !107
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !111
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !112
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx4, align 4, !dbg !114
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !115
  call void @printWLine(i32* %arraydecay5), !dbg !116
  br label %if.end, !dbg !117

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !118
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_14_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 18, scope: !16)
!18 = !DILocation(line: 24, column: 8, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 27, type: !22)
!20 = distinct !DILexicalBlock(scope: !21, file: !12, line: 26, column: 9)
!21 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 4800, elements: !26)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !25)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !{!27}
!27 = !DISubrange(count: 150)
!28 = !DILocation(line: 27, column: 21, scope: !20)
!29 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 32, scope: !20)
!34 = !DILocation(line: 29, column: 21, scope: !20)
!35 = !DILocation(line: 29, column: 13, scope: !20)
!36 = !DILocation(line: 30, column: 13, scope: !20)
!37 = !DILocation(line: 30, column: 23, scope: !20)
!38 = !DILocation(line: 33, column: 21, scope: !20)
!39 = !DILocation(line: 33, column: 27, scope: !20)
!40 = !DILocation(line: 33, column: 13, scope: !20)
!41 = !DILocation(line: 35, column: 24, scope: !20)
!42 = !DILocation(line: 35, column: 13, scope: !20)
!43 = !DILocation(line: 37, column: 5, scope: !21)
!44 = !DILocation(line: 38, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_14_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 89, column: 5, scope: !45)
!47 = !DILocation(line: 90, column: 5, scope: !45)
!48 = !DILocation(line: 91, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !50, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!25, !25, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 102, type: !25)
!56 = !DILocation(line: 102, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 102, type: !52)
!58 = !DILocation(line: 102, column: 27, scope: !49)
!59 = !DILocation(line: 105, column: 22, scope: !49)
!60 = !DILocation(line: 105, column: 12, scope: !49)
!61 = !DILocation(line: 105, column: 5, scope: !49)
!62 = !DILocation(line: 107, column: 5, scope: !49)
!63 = !DILocation(line: 108, column: 5, scope: !49)
!64 = !DILocation(line: 109, column: 5, scope: !49)
!65 = !DILocation(line: 112, column: 5, scope: !49)
!66 = !DILocation(line: 113, column: 5, scope: !49)
!67 = !DILocation(line: 114, column: 5, scope: !49)
!68 = !DILocation(line: 116, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 47, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !69, file: !12, line: 47, column: 8)
!72 = !DILocation(line: 47, column: 18, scope: !71)
!73 = !DILocation(line: 47, column: 8, scope: !69)
!74 = !DILocation(line: 50, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !12, line: 48, column: 5)
!76 = !DILocation(line: 51, column: 5, scope: !75)
!77 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 55, type: !22)
!78 = distinct !DILexicalBlock(scope: !79, file: !12, line: 54, column: 9)
!79 = distinct !DILexicalBlock(scope: !71, file: !12, line: 53, column: 5)
!80 = !DILocation(line: 55, column: 21, scope: !78)
!81 = !DILocalVariable(name: "dest", scope: !78, file: !12, line: 55, type: !30)
!82 = !DILocation(line: 55, column: 32, scope: !78)
!83 = !DILocation(line: 57, column: 21, scope: !78)
!84 = !DILocation(line: 57, column: 13, scope: !78)
!85 = !DILocation(line: 58, column: 13, scope: !78)
!86 = !DILocation(line: 58, column: 23, scope: !78)
!87 = !DILocation(line: 61, column: 21, scope: !78)
!88 = !DILocation(line: 61, column: 27, scope: !78)
!89 = !DILocation(line: 61, column: 13, scope: !78)
!90 = !DILocation(line: 62, column: 13, scope: !78)
!91 = !DILocation(line: 62, column: 22, scope: !78)
!92 = !DILocation(line: 63, column: 24, scope: !78)
!93 = !DILocation(line: 63, column: 13, scope: !78)
!94 = !DILocation(line: 66, column: 1, scope: !69)
!95 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 71, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !95, file: !12, line: 71, column: 8)
!98 = !DILocation(line: 71, column: 18, scope: !97)
!99 = !DILocation(line: 71, column: 8, scope: !95)
!100 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 74, type: !22)
!101 = distinct !DILexicalBlock(scope: !102, file: !12, line: 73, column: 9)
!102 = distinct !DILexicalBlock(scope: !97, file: !12, line: 72, column: 5)
!103 = !DILocation(line: 74, column: 21, scope: !101)
!104 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 74, type: !30)
!105 = !DILocation(line: 74, column: 32, scope: !101)
!106 = !DILocation(line: 76, column: 21, scope: !101)
!107 = !DILocation(line: 76, column: 13, scope: !101)
!108 = !DILocation(line: 77, column: 13, scope: !101)
!109 = !DILocation(line: 77, column: 23, scope: !101)
!110 = !DILocation(line: 80, column: 21, scope: !101)
!111 = !DILocation(line: 80, column: 27, scope: !101)
!112 = !DILocation(line: 80, column: 13, scope: !101)
!113 = !DILocation(line: 81, column: 13, scope: !101)
!114 = !DILocation(line: 81, column: 22, scope: !101)
!115 = !DILocation(line: 82, column: 24, scope: !101)
!116 = !DILocation(line: 82, column: 13, scope: !101)
!117 = !DILocation(line: 84, column: 5, scope: !102)
!118 = !DILocation(line: 85, column: 1, scope: !95)
