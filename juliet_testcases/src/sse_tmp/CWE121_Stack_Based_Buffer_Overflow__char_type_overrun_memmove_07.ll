; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_07_bad() #0 !dbg !19 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !22
  %cmp = icmp eq i32 %0, 5, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !26, metadata !DIExpression()), !dbg !38
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !39
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !40
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !41
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !41
  call void @printLine(i8* %1), !dbg !42
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !43
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !44
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !45
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !46
  store i8 0, i8* %arrayidx, align 1, !dbg !47
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !48
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !49
  call void @printLine(i8* %arraydecay4), !dbg !50
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !51
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !51
  call void @printLine(i8* %2), !dbg !52
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_07_good() #0 !dbg !55 {
entry:
  call void @good1(), !dbg !56
  call void @good2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_07_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_07_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !77 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !78
  %cmp = icmp ne i32 %0, 5, !dbg !80
  br i1 %cmp, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !85, metadata !DIExpression()), !dbg !88
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !89
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !90
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !91
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !91
  call void @printLine(i8* %1), !dbg !92
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !93
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !94
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !94
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !95
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !98
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !99
  call void @printLine(i8* %arraydecay4), !dbg !100
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !101
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !101
  call void @printLine(i8* %2), !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !104 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !105
  %cmp = icmp eq i32 %0, 5, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !109, metadata !DIExpression()), !dbg !112
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !113
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !114
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !115
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !115
  call void @printLine(i8* %1), !dbg !116
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !117
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !118
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !118
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !119
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !122
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !123
  call void @printLine(i8* %arraydecay4), !dbg !124
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !125
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !125
  call void @printLine(i8* %2), !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 35, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_07_bad", scope: !11, file: !11, line: 39, type: !20, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocation(line: 41, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !11, line: 41, column: 8)
!24 = !DILocation(line: 41, column: 18, scope: !23)
!25 = !DILocation(line: 41, column: 8, scope: !19)
!26 = !DILocalVariable(name: "structCharVoid", scope: !27, file: !11, line: 44, type: !29)
!27 = distinct !DILexicalBlock(scope: !28, file: !11, line: 43, column: 9)
!28 = distinct !DILexicalBlock(scope: !23, file: !11, line: 42, column: 5)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !11, line: 30, baseType: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !11, line: 25, size: 256, elements: !31)
!31 = !{!32, !36, !37}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !30, file: !11, line: 27, baseType: !33, size: 128)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 128, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 16)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !30, file: !11, line: 28, baseType: !6, size: 64, offset: 128)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !30, file: !11, line: 29, baseType: !6, size: 64, offset: 192)
!38 = !DILocation(line: 44, column: 22, scope: !27)
!39 = !DILocation(line: 45, column: 28, scope: !27)
!40 = !DILocation(line: 45, column: 39, scope: !27)
!41 = !DILocation(line: 47, column: 46, scope: !27)
!42 = !DILocation(line: 47, column: 13, scope: !27)
!43 = !DILocation(line: 49, column: 36, scope: !27)
!44 = !DILocation(line: 49, column: 13, scope: !27)
!45 = !DILocation(line: 50, column: 28, scope: !27)
!46 = !DILocation(line: 50, column: 13, scope: !27)
!47 = !DILocation(line: 50, column: 89, scope: !27)
!48 = !DILocation(line: 51, column: 46, scope: !27)
!49 = !DILocation(line: 51, column: 31, scope: !27)
!50 = !DILocation(line: 51, column: 13, scope: !27)
!51 = !DILocation(line: 52, column: 46, scope: !27)
!52 = !DILocation(line: 52, column: 13, scope: !27)
!53 = !DILocation(line: 54, column: 5, scope: !28)
!54 = !DILocation(line: 55, column: 1, scope: !19)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_07_good", scope: !11, file: !11, line: 104, type: !20, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 106, column: 5, scope: !55)
!57 = !DILocation(line: 107, column: 5, scope: !55)
!58 = !DILocation(line: 108, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 119, type: !60, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!12, !12, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !11, line: 119, type: !12)
!64 = !DILocation(line: 119, column: 14, scope: !59)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !11, line: 119, type: !62)
!66 = !DILocation(line: 119, column: 27, scope: !59)
!67 = !DILocation(line: 122, column: 22, scope: !59)
!68 = !DILocation(line: 122, column: 12, scope: !59)
!69 = !DILocation(line: 122, column: 5, scope: !59)
!70 = !DILocation(line: 124, column: 5, scope: !59)
!71 = !DILocation(line: 125, column: 5, scope: !59)
!72 = !DILocation(line: 126, column: 5, scope: !59)
!73 = !DILocation(line: 129, column: 5, scope: !59)
!74 = !DILocation(line: 130, column: 5, scope: !59)
!75 = !DILocation(line: 131, column: 5, scope: !59)
!76 = !DILocation(line: 133, column: 5, scope: !59)
!77 = distinct !DISubprogram(name: "good1", scope: !11, file: !11, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 64, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !77, file: !11, line: 64, column: 8)
!80 = !DILocation(line: 64, column: 18, scope: !79)
!81 = !DILocation(line: 64, column: 8, scope: !77)
!82 = !DILocation(line: 67, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !11, line: 65, column: 5)
!84 = !DILocation(line: 68, column: 5, scope: !83)
!85 = !DILocalVariable(name: "structCharVoid", scope: !86, file: !11, line: 72, type: !29)
!86 = distinct !DILexicalBlock(scope: !87, file: !11, line: 71, column: 9)
!87 = distinct !DILexicalBlock(scope: !79, file: !11, line: 70, column: 5)
!88 = !DILocation(line: 72, column: 22, scope: !86)
!89 = !DILocation(line: 73, column: 28, scope: !86)
!90 = !DILocation(line: 73, column: 39, scope: !86)
!91 = !DILocation(line: 75, column: 46, scope: !86)
!92 = !DILocation(line: 75, column: 13, scope: !86)
!93 = !DILocation(line: 77, column: 36, scope: !86)
!94 = !DILocation(line: 77, column: 13, scope: !86)
!95 = !DILocation(line: 78, column: 28, scope: !86)
!96 = !DILocation(line: 78, column: 13, scope: !86)
!97 = !DILocation(line: 78, column: 89, scope: !86)
!98 = !DILocation(line: 79, column: 46, scope: !86)
!99 = !DILocation(line: 79, column: 31, scope: !86)
!100 = !DILocation(line: 79, column: 13, scope: !86)
!101 = !DILocation(line: 80, column: 46, scope: !86)
!102 = !DILocation(line: 80, column: 13, scope: !86)
!103 = !DILocation(line: 83, column: 1, scope: !77)
!104 = distinct !DISubprogram(name: "good2", scope: !11, file: !11, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocation(line: 88, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !104, file: !11, line: 88, column: 8)
!107 = !DILocation(line: 88, column: 18, scope: !106)
!108 = !DILocation(line: 88, column: 8, scope: !104)
!109 = !DILocalVariable(name: "structCharVoid", scope: !110, file: !11, line: 91, type: !29)
!110 = distinct !DILexicalBlock(scope: !111, file: !11, line: 90, column: 9)
!111 = distinct !DILexicalBlock(scope: !106, file: !11, line: 89, column: 5)
!112 = !DILocation(line: 91, column: 22, scope: !110)
!113 = !DILocation(line: 92, column: 28, scope: !110)
!114 = !DILocation(line: 92, column: 39, scope: !110)
!115 = !DILocation(line: 94, column: 46, scope: !110)
!116 = !DILocation(line: 94, column: 13, scope: !110)
!117 = !DILocation(line: 96, column: 36, scope: !110)
!118 = !DILocation(line: 96, column: 13, scope: !110)
!119 = !DILocation(line: 97, column: 28, scope: !110)
!120 = !DILocation(line: 97, column: 13, scope: !110)
!121 = !DILocation(line: 97, column: 89, scope: !110)
!122 = !DILocation(line: 98, column: 46, scope: !110)
!123 = !DILocation(line: 98, column: 31, scope: !110)
!124 = !DILocation(line: 98, column: 13, scope: !110)
!125 = !DILocation(line: 99, column: 46, scope: !110)
!126 = !DILocation(line: 99, column: 13, scope: !110)
!127 = !DILocation(line: 101, column: 5, scope: !111)
!128 = !DILocation(line: 102, column: 1, scope: !104)
