; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !24, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !38
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !39
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !43
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !44
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  call void @printWLine(i32* %arraydecay4), !dbg !46
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_05_good() #0 !dbg !49 {
entry:
  call void @good1(), !dbg !50
  call void @good2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #4, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #4, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_05_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_05_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !73 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticFalse, align 4, !dbg !74
  %tobool = icmp ne i32 %0, 0, !dbg !74
  br i1 %tobool, label %if.then, label %if.else, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  br label %if.end, !dbg !79

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !80, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !86
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !87
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !90
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !91
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !92
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !93
  store i32 0, i32* %arrayidx4, align 4, !dbg !94
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !95
  call void @printWLine(i32* %arraydecay5), !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !98 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticTrue, align 4, !dbg !99
  %tobool = icmp ne i32 %0, 0, !dbg !99
  br i1 %tobool, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !102, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !108
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !109
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !113
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !114
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx4, align 4, !dbg !116
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  call void @printWLine(i32* %arraydecay5), !dbg !118
  br label %if.end, !dbg !119

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocation(line: 30, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 30, column: 8)
!23 = !DILocation(line: 30, column: 8, scope: !18)
!24 = !DILocalVariable(name: "data", scope: !25, file: !10, line: 33, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !10, line: 32, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !10, line: 31, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 4800, elements: !30)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !29, line: 74, baseType: !11)
!29 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!30 = !{!31}
!31 = !DISubrange(count: 150)
!32 = !DILocation(line: 33, column: 21, scope: !25)
!33 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 33, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 33, column: 32, scope: !25)
!38 = !DILocation(line: 35, column: 21, scope: !25)
!39 = !DILocation(line: 35, column: 13, scope: !25)
!40 = !DILocation(line: 36, column: 13, scope: !25)
!41 = !DILocation(line: 36, column: 23, scope: !25)
!42 = !DILocation(line: 39, column: 21, scope: !25)
!43 = !DILocation(line: 39, column: 27, scope: !25)
!44 = !DILocation(line: 39, column: 13, scope: !25)
!45 = !DILocation(line: 41, column: 24, scope: !25)
!46 = !DILocation(line: 41, column: 13, scope: !25)
!47 = !DILocation(line: 43, column: 5, scope: !26)
!48 = !DILocation(line: 44, column: 1, scope: !18)
!49 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_05_good", scope: !10, file: !10, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DILocation(line: 95, column: 5, scope: !49)
!51 = !DILocation(line: 96, column: 5, scope: !49)
!52 = !DILocation(line: 97, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 108, type: !54, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!11, !11, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !10, line: 108, type: !11)
!60 = !DILocation(line: 108, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !10, line: 108, type: !56)
!62 = !DILocation(line: 108, column: 27, scope: !53)
!63 = !DILocation(line: 111, column: 22, scope: !53)
!64 = !DILocation(line: 111, column: 12, scope: !53)
!65 = !DILocation(line: 111, column: 5, scope: !53)
!66 = !DILocation(line: 113, column: 5, scope: !53)
!67 = !DILocation(line: 114, column: 5, scope: !53)
!68 = !DILocation(line: 115, column: 5, scope: !53)
!69 = !DILocation(line: 118, column: 5, scope: !53)
!70 = !DILocation(line: 119, column: 5, scope: !53)
!71 = !DILocation(line: 120, column: 5, scope: !53)
!72 = !DILocation(line: 122, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "good1", scope: !10, file: !10, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 53, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !73, file: !10, line: 53, column: 8)
!76 = !DILocation(line: 53, column: 8, scope: !73)
!77 = !DILocation(line: 56, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !10, line: 54, column: 5)
!79 = !DILocation(line: 57, column: 5, scope: !78)
!80 = !DILocalVariable(name: "data", scope: !81, file: !10, line: 61, type: !27)
!81 = distinct !DILexicalBlock(scope: !82, file: !10, line: 60, column: 9)
!82 = distinct !DILexicalBlock(scope: !75, file: !10, line: 59, column: 5)
!83 = !DILocation(line: 61, column: 21, scope: !81)
!84 = !DILocalVariable(name: "dest", scope: !81, file: !10, line: 61, type: !34)
!85 = !DILocation(line: 61, column: 32, scope: !81)
!86 = !DILocation(line: 63, column: 21, scope: !81)
!87 = !DILocation(line: 63, column: 13, scope: !81)
!88 = !DILocation(line: 64, column: 13, scope: !81)
!89 = !DILocation(line: 64, column: 23, scope: !81)
!90 = !DILocation(line: 67, column: 21, scope: !81)
!91 = !DILocation(line: 67, column: 27, scope: !81)
!92 = !DILocation(line: 67, column: 13, scope: !81)
!93 = !DILocation(line: 68, column: 13, scope: !81)
!94 = !DILocation(line: 68, column: 22, scope: !81)
!95 = !DILocation(line: 69, column: 24, scope: !81)
!96 = !DILocation(line: 69, column: 13, scope: !81)
!97 = !DILocation(line: 72, column: 1, scope: !73)
!98 = distinct !DISubprogram(name: "good2", scope: !10, file: !10, line: 75, type: !19, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocation(line: 77, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !98, file: !10, line: 77, column: 8)
!101 = !DILocation(line: 77, column: 8, scope: !98)
!102 = !DILocalVariable(name: "data", scope: !103, file: !10, line: 80, type: !27)
!103 = distinct !DILexicalBlock(scope: !104, file: !10, line: 79, column: 9)
!104 = distinct !DILexicalBlock(scope: !100, file: !10, line: 78, column: 5)
!105 = !DILocation(line: 80, column: 21, scope: !103)
!106 = !DILocalVariable(name: "dest", scope: !103, file: !10, line: 80, type: !34)
!107 = !DILocation(line: 80, column: 32, scope: !103)
!108 = !DILocation(line: 82, column: 21, scope: !103)
!109 = !DILocation(line: 82, column: 13, scope: !103)
!110 = !DILocation(line: 83, column: 13, scope: !103)
!111 = !DILocation(line: 83, column: 23, scope: !103)
!112 = !DILocation(line: 86, column: 21, scope: !103)
!113 = !DILocation(line: 86, column: 27, scope: !103)
!114 = !DILocation(line: 86, column: 13, scope: !103)
!115 = !DILocation(line: 87, column: 13, scope: !103)
!116 = !DILocation(line: 87, column: 22, scope: !103)
!117 = !DILocation(line: 88, column: 24, scope: !103)
!118 = !DILocation(line: 88, column: 13, scope: !103)
!119 = !DILocation(line: 90, column: 5, scope: !104)
!120 = !DILocation(line: 91, column: 1, scope: !98)
