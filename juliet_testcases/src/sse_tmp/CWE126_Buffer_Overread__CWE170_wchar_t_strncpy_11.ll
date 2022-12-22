; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_11.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_11_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %call = call i32 (...) @globalReturnsTrue(), !dbg !15
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

declare dso_local i32 @globalReturnsTrue(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

declare dso_local void @printWLine(i32*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_11_good() #0 !dbg !44 {
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
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_11_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_11_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !68 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %call = call i32 (...) @globalReturnsFalse(), !dbg !69
  %tobool = icmp ne i32 %call, 0, !dbg !69
  br i1 %tobool, label %if.then, label %if.else, !dbg !71

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  br label %if.end, !dbg !74

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !75, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !81
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !82
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  %arraydecay3 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !86
  %call4 = call i32* @wcsncpy(i32* %arraydecay2, i32* %arraydecay3, i64 99) #4, !dbg !87
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx5, align 4, !dbg !89
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !90
  call void @printWLine(i32* %arraydecay6), !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !92
}

declare dso_local i32 @globalReturnsFalse(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !93 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %call = call i32 (...) @globalReturnsTrue(), !dbg !94
  %tobool = icmp ne i32 %call, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !97, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !103
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !104
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !107
  %arraydecay3 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !108
  %call4 = call i32* @wcsncpy(i32* %arraydecay2, i32* %arraydecay3, i64 99) #4, !dbg !109
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx5, align 4, !dbg !111
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* %arraydecay6), !dbg !113
  br label %if.end, !dbg !114

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !115
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_11.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_11_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_11.c", directory: "/root/SSE-Assessment")
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
!23 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
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
!43 = !DILocation(line: 38, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_11_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 89, column: 5, scope: !44)
!46 = !DILocation(line: 90, column: 5, scope: !44)
!47 = !DILocation(line: 91, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !49, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!24, !24, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 102, type: !24)
!55 = !DILocation(line: 102, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 102, type: !51)
!57 = !DILocation(line: 102, column: 27, scope: !48)
!58 = !DILocation(line: 105, column: 22, scope: !48)
!59 = !DILocation(line: 105, column: 12, scope: !48)
!60 = !DILocation(line: 105, column: 5, scope: !48)
!61 = !DILocation(line: 107, column: 5, scope: !48)
!62 = !DILocation(line: 108, column: 5, scope: !48)
!63 = !DILocation(line: 109, column: 5, scope: !48)
!64 = !DILocation(line: 112, column: 5, scope: !48)
!65 = !DILocation(line: 113, column: 5, scope: !48)
!66 = !DILocation(line: 114, column: 5, scope: !48)
!67 = !DILocation(line: 116, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 47, column: 8, scope: !70)
!70 = distinct !DILexicalBlock(scope: !68, file: !12, line: 47, column: 8)
!71 = !DILocation(line: 47, column: 8, scope: !68)
!72 = !DILocation(line: 50, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !12, line: 48, column: 5)
!74 = !DILocation(line: 51, column: 5, scope: !73)
!75 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 55, type: !21)
!76 = distinct !DILexicalBlock(scope: !77, file: !12, line: 54, column: 9)
!77 = distinct !DILexicalBlock(scope: !70, file: !12, line: 53, column: 5)
!78 = !DILocation(line: 55, column: 21, scope: !76)
!79 = !DILocalVariable(name: "dest", scope: !76, file: !12, line: 55, type: !29)
!80 = !DILocation(line: 55, column: 32, scope: !76)
!81 = !DILocation(line: 57, column: 21, scope: !76)
!82 = !DILocation(line: 57, column: 13, scope: !76)
!83 = !DILocation(line: 58, column: 13, scope: !76)
!84 = !DILocation(line: 58, column: 23, scope: !76)
!85 = !DILocation(line: 61, column: 21, scope: !76)
!86 = !DILocation(line: 61, column: 27, scope: !76)
!87 = !DILocation(line: 61, column: 13, scope: !76)
!88 = !DILocation(line: 62, column: 13, scope: !76)
!89 = !DILocation(line: 62, column: 22, scope: !76)
!90 = !DILocation(line: 63, column: 24, scope: !76)
!91 = !DILocation(line: 63, column: 13, scope: !76)
!92 = !DILocation(line: 66, column: 1, scope: !68)
!93 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 71, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !93, file: !12, line: 71, column: 8)
!96 = !DILocation(line: 71, column: 8, scope: !93)
!97 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 74, type: !21)
!98 = distinct !DILexicalBlock(scope: !99, file: !12, line: 73, column: 9)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 72, column: 5)
!100 = !DILocation(line: 74, column: 21, scope: !98)
!101 = !DILocalVariable(name: "dest", scope: !98, file: !12, line: 74, type: !29)
!102 = !DILocation(line: 74, column: 32, scope: !98)
!103 = !DILocation(line: 76, column: 21, scope: !98)
!104 = !DILocation(line: 76, column: 13, scope: !98)
!105 = !DILocation(line: 77, column: 13, scope: !98)
!106 = !DILocation(line: 77, column: 23, scope: !98)
!107 = !DILocation(line: 80, column: 21, scope: !98)
!108 = !DILocation(line: 80, column: 27, scope: !98)
!109 = !DILocation(line: 80, column: 13, scope: !98)
!110 = !DILocation(line: 81, column: 13, scope: !98)
!111 = !DILocation(line: 81, column: 22, scope: !98)
!112 = !DILocation(line: 82, column: 24, scope: !98)
!113 = !DILocation(line: 82, column: 13, scope: !98)
!114 = !DILocation(line: 84, column: 5, scope: !99)
!115 = !DILocation(line: 85, column: 1, scope: !93)
