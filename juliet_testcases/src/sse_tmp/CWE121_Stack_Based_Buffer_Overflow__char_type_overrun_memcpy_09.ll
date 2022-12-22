; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_09_bad() #0 !dbg !14 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !18
  %tobool = icmp ne i32 %0, 0, !dbg !18
  br i1 %tobool, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !21, metadata !DIExpression()), !dbg !33
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !34
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !35
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !36
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !36
  call void @printLine(i8* %1), !dbg !37
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !38
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !39
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !40
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !43
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !44
  call void @printLine(i8* %arraydecay4), !dbg !45
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !46
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !46
  call void @printLine(i8* %2), !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_09_good() #0 !dbg !50 {
entry:
  call void @good1(), !dbg !51
  call void @good2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_09_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_09_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !73 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !74
  %tobool = icmp ne i32 %0, 0, !dbg !74
  br i1 %tobool, label %if.then, label %if.else, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !77
  br label %if.end, !dbg !79

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !80, metadata !DIExpression()), !dbg !83
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !84
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !85
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !86
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !86
  call void @printLine(i8* %1), !dbg !87
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !88
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !89
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !90
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !93
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !94
  call void @printLine(i8* %arraydecay4), !dbg !95
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !96
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !96
  call void @printLine(i8* %2), !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !99 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !100
  %tobool = icmp ne i32 %0, 0, !dbg !100
  br i1 %tobool, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !103, metadata !DIExpression()), !dbg !106
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !107
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !108
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !109
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !109
  call void @printLine(i8* %1), !dbg !110
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !111
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !112
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !113
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !116
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !117
  call void @printLine(i8* %arraydecay4), !dbg !118
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !119
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !119
  call void @printLine(i8* %2), !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_09.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_09_bad", scope: !15, file: !15, line: 34, type: !16, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_09.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 36, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 8)
!20 = !DILocation(line: 36, column: 8, scope: !14)
!21 = !DILocalVariable(name: "structCharVoid", scope: !22, file: !15, line: 39, type: !24)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 38, column: 9)
!23 = distinct !DILexicalBlock(scope: !19, file: !15, line: 37, column: 5)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !15, line: 30, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !15, line: 25, size: 256, elements: !26)
!26 = !{!27, !31, !32}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !25, file: !15, line: 27, baseType: !28, size: 128)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 16)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !25, file: !15, line: 28, baseType: !4, size: 64, offset: 128)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !25, file: !15, line: 29, baseType: !4, size: 64, offset: 192)
!33 = !DILocation(line: 39, column: 22, scope: !22)
!34 = !DILocation(line: 40, column: 28, scope: !22)
!35 = !DILocation(line: 40, column: 39, scope: !22)
!36 = !DILocation(line: 42, column: 46, scope: !22)
!37 = !DILocation(line: 42, column: 13, scope: !22)
!38 = !DILocation(line: 44, column: 35, scope: !22)
!39 = !DILocation(line: 44, column: 13, scope: !22)
!40 = !DILocation(line: 45, column: 28, scope: !22)
!41 = !DILocation(line: 45, column: 13, scope: !22)
!42 = !DILocation(line: 45, column: 89, scope: !22)
!43 = !DILocation(line: 46, column: 46, scope: !22)
!44 = !DILocation(line: 46, column: 31, scope: !22)
!45 = !DILocation(line: 46, column: 13, scope: !22)
!46 = !DILocation(line: 47, column: 46, scope: !22)
!47 = !DILocation(line: 47, column: 13, scope: !22)
!48 = !DILocation(line: 49, column: 5, scope: !23)
!49 = !DILocation(line: 50, column: 1, scope: !14)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_09_good", scope: !15, file: !15, line: 99, type: !16, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 101, column: 5, scope: !50)
!52 = !DILocation(line: 102, column: 5, scope: !50)
!53 = !DILocation(line: 103, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 114, type: !55, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !15, line: 114, type: !57)
!60 = !DILocation(line: 114, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !15, line: 114, type: !58)
!62 = !DILocation(line: 114, column: 27, scope: !54)
!63 = !DILocation(line: 117, column: 22, scope: !54)
!64 = !DILocation(line: 117, column: 12, scope: !54)
!65 = !DILocation(line: 117, column: 5, scope: !54)
!66 = !DILocation(line: 119, column: 5, scope: !54)
!67 = !DILocation(line: 120, column: 5, scope: !54)
!68 = !DILocation(line: 121, column: 5, scope: !54)
!69 = !DILocation(line: 124, column: 5, scope: !54)
!70 = !DILocation(line: 125, column: 5, scope: !54)
!71 = !DILocation(line: 126, column: 5, scope: !54)
!72 = !DILocation(line: 128, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "good1", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 59, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !73, file: !15, line: 59, column: 8)
!76 = !DILocation(line: 59, column: 8, scope: !73)
!77 = !DILocation(line: 62, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !15, line: 60, column: 5)
!79 = !DILocation(line: 63, column: 5, scope: !78)
!80 = !DILocalVariable(name: "structCharVoid", scope: !81, file: !15, line: 67, type: !24)
!81 = distinct !DILexicalBlock(scope: !82, file: !15, line: 66, column: 9)
!82 = distinct !DILexicalBlock(scope: !75, file: !15, line: 65, column: 5)
!83 = !DILocation(line: 67, column: 22, scope: !81)
!84 = !DILocation(line: 68, column: 28, scope: !81)
!85 = !DILocation(line: 68, column: 39, scope: !81)
!86 = !DILocation(line: 70, column: 46, scope: !81)
!87 = !DILocation(line: 70, column: 13, scope: !81)
!88 = !DILocation(line: 72, column: 35, scope: !81)
!89 = !DILocation(line: 72, column: 13, scope: !81)
!90 = !DILocation(line: 73, column: 28, scope: !81)
!91 = !DILocation(line: 73, column: 13, scope: !81)
!92 = !DILocation(line: 73, column: 89, scope: !81)
!93 = !DILocation(line: 74, column: 46, scope: !81)
!94 = !DILocation(line: 74, column: 31, scope: !81)
!95 = !DILocation(line: 74, column: 13, scope: !81)
!96 = !DILocation(line: 75, column: 46, scope: !81)
!97 = !DILocation(line: 75, column: 13, scope: !81)
!98 = !DILocation(line: 78, column: 1, scope: !73)
!99 = distinct !DISubprogram(name: "good2", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocation(line: 83, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !99, file: !15, line: 83, column: 8)
!102 = !DILocation(line: 83, column: 8, scope: !99)
!103 = !DILocalVariable(name: "structCharVoid", scope: !104, file: !15, line: 86, type: !24)
!104 = distinct !DILexicalBlock(scope: !105, file: !15, line: 85, column: 9)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 84, column: 5)
!106 = !DILocation(line: 86, column: 22, scope: !104)
!107 = !DILocation(line: 87, column: 28, scope: !104)
!108 = !DILocation(line: 87, column: 39, scope: !104)
!109 = !DILocation(line: 89, column: 46, scope: !104)
!110 = !DILocation(line: 89, column: 13, scope: !104)
!111 = !DILocation(line: 91, column: 35, scope: !104)
!112 = !DILocation(line: 91, column: 13, scope: !104)
!113 = !DILocation(line: 92, column: 28, scope: !104)
!114 = !DILocation(line: 92, column: 13, scope: !104)
!115 = !DILocation(line: 92, column: 89, scope: !104)
!116 = !DILocation(line: 93, column: 46, scope: !104)
!117 = !DILocation(line: 93, column: 31, scope: !104)
!118 = !DILocation(line: 93, column: 13, scope: !104)
!119 = !DILocation(line: 94, column: 46, scope: !104)
!120 = !DILocation(line: 94, column: 13, scope: !104)
!121 = !DILocation(line: 96, column: 5, scope: !105)
!122 = !DILocation(line: 97, column: 1, scope: !99)
