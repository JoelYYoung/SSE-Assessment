; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #6, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %4 = load i32*, i32** %data, align 8, !dbg !49
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #6, !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %6), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_05_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #6, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #6, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_05_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_05_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !85
  store i32* %arraydecay, i32** %data, align 8, !dbg !86
  %0 = load i32, i32* @staticFalse, align 4, !dbg !87
  %tobool = icmp ne i32 %0, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !95
  %2 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !100
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !101
  %4 = load i32*, i32** %data, align 8, !dbg !102
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !104
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #6, !dbg !105
  %6 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %6), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !114
  store i32* %arraydecay, i32** %data, align 8, !dbg !115
  %0 = load i32, i32* @staticTrue, align 4, !dbg !116
  %tobool = icmp ne i32 %0, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !121
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !127
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !128
  %4 = load i32*, i32** %data, align 8, !dbg !129
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !130
  %5 = load i32*, i32** %data, align 8, !dbg !131
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #6, !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !133
  call void @printWLine(i32* %6), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 31, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 32, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_05_bad", scope: !10, file: !10, line: 36, type: !19, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 38, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DILocation(line: 38, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 39, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 39, column: 13, scope: !18)
!31 = !DILocation(line: 40, column: 12, scope: !18)
!32 = !DILocation(line: 40, column: 10, scope: !18)
!33 = !DILocation(line: 41, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 8)
!35 = !DILocation(line: 41, column: 8, scope: !18)
!36 = !DILocation(line: 44, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 42, column: 5)
!38 = !DILocation(line: 44, column: 9, scope: !37)
!39 = !DILocation(line: 45, column: 9, scope: !37)
!40 = !DILocation(line: 45, column: 21, scope: !37)
!41 = !DILocation(line: 46, column: 5, scope: !37)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !10, line: 48, type: !44)
!43 = distinct !DILexicalBlock(scope: !18, file: !10, line: 47, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 48, column: 17, scope: !43)
!48 = !DILocation(line: 50, column: 18, scope: !43)
!49 = !DILocation(line: 50, column: 31, scope: !43)
!50 = !DILocation(line: 50, column: 24, scope: !43)
!51 = !DILocation(line: 50, column: 45, scope: !43)
!52 = !DILocation(line: 50, column: 9, scope: !43)
!53 = !DILocation(line: 51, column: 20, scope: !43)
!54 = !DILocation(line: 51, column: 9, scope: !43)
!55 = !DILocation(line: 53, column: 1, scope: !18)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_05_good", scope: !10, file: !10, line: 104, type: !19, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 106, column: 5, scope: !56)
!58 = !DILocation(line: 107, column: 5, scope: !56)
!59 = !DILocation(line: 108, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 120, type: !61, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!11, !11, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !10, line: 120, type: !11)
!67 = !DILocation(line: 120, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !10, line: 120, type: !63)
!69 = !DILocation(line: 120, column: 27, scope: !60)
!70 = !DILocation(line: 123, column: 22, scope: !60)
!71 = !DILocation(line: 123, column: 12, scope: !60)
!72 = !DILocation(line: 123, column: 5, scope: !60)
!73 = !DILocation(line: 125, column: 5, scope: !60)
!74 = !DILocation(line: 126, column: 5, scope: !60)
!75 = !DILocation(line: 127, column: 5, scope: !60)
!76 = !DILocation(line: 130, column: 5, scope: !60)
!77 = !DILocation(line: 131, column: 5, scope: !60)
!78 = !DILocation(line: 132, column: 5, scope: !60)
!79 = !DILocation(line: 134, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !10, line: 62, type: !22)
!82 = !DILocation(line: 62, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !10, line: 63, type: !27)
!84 = !DILocation(line: 63, column: 13, scope: !80)
!85 = !DILocation(line: 64, column: 12, scope: !80)
!86 = !DILocation(line: 64, column: 10, scope: !80)
!87 = !DILocation(line: 65, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !80, file: !10, line: 65, column: 8)
!89 = !DILocation(line: 65, column: 8, scope: !80)
!90 = !DILocation(line: 68, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !10, line: 66, column: 5)
!92 = !DILocation(line: 69, column: 5, scope: !91)
!93 = !DILocation(line: 73, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !10, line: 71, column: 5)
!95 = !DILocation(line: 73, column: 9, scope: !94)
!96 = !DILocation(line: 74, column: 9, scope: !94)
!97 = !DILocation(line: 74, column: 20, scope: !94)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !10, line: 77, type: !44)
!99 = distinct !DILexicalBlock(scope: !80, file: !10, line: 76, column: 5)
!100 = !DILocation(line: 77, column: 17, scope: !99)
!101 = !DILocation(line: 79, column: 18, scope: !99)
!102 = !DILocation(line: 79, column: 31, scope: !99)
!103 = !DILocation(line: 79, column: 24, scope: !99)
!104 = !DILocation(line: 79, column: 45, scope: !99)
!105 = !DILocation(line: 79, column: 9, scope: !99)
!106 = !DILocation(line: 80, column: 20, scope: !99)
!107 = !DILocation(line: 80, column: 9, scope: !99)
!108 = !DILocation(line: 82, column: 1, scope: !80)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 85, type: !19, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !10, line: 87, type: !22)
!111 = !DILocation(line: 87, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !10, line: 88, type: !27)
!113 = !DILocation(line: 88, column: 13, scope: !109)
!114 = !DILocation(line: 89, column: 12, scope: !109)
!115 = !DILocation(line: 89, column: 10, scope: !109)
!116 = !DILocation(line: 90, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !10, line: 90, column: 8)
!118 = !DILocation(line: 90, column: 8, scope: !109)
!119 = !DILocation(line: 93, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !10, line: 91, column: 5)
!121 = !DILocation(line: 93, column: 9, scope: !120)
!122 = !DILocation(line: 94, column: 9, scope: !120)
!123 = !DILocation(line: 94, column: 20, scope: !120)
!124 = !DILocation(line: 95, column: 5, scope: !120)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !10, line: 97, type: !44)
!126 = distinct !DILexicalBlock(scope: !109, file: !10, line: 96, column: 5)
!127 = !DILocation(line: 97, column: 17, scope: !126)
!128 = !DILocation(line: 99, column: 18, scope: !126)
!129 = !DILocation(line: 99, column: 31, scope: !126)
!130 = !DILocation(line: 99, column: 24, scope: !126)
!131 = !DILocation(line: 99, column: 45, scope: !126)
!132 = !DILocation(line: 99, column: 9, scope: !126)
!133 = !DILocation(line: 100, column: 20, scope: !126)
!134 = !DILocation(line: 100, column: 9, scope: !126)
!135 = !DILocation(line: 102, column: 1, scope: !109)
