; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_08_bad() #0 !dbg !14 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %call = call i32 @staticReturnsTrue(), !dbg !18
  %tobool = icmp ne i32 %call, 0, !dbg !18
  br i1 %tobool, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !21, metadata !DIExpression()), !dbg !33
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !34
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !35
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !36
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !36
  call void @printLine(i8* %0), !dbg !37
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
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !46
  call void @printLine(i8* %1), !dbg !47
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_08_good() #0 !dbg !50 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_08_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_08_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !73 {
entry:
  ret i32 1, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !77 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %call = call i32 @staticReturnsFalse(), !dbg !78
  %tobool = icmp ne i32 %call, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !81
  br label %if.end, !dbg !83

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !84, metadata !DIExpression()), !dbg !87
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !88
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !89
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !90
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !90
  call void @printLine(i8* %0), !dbg !91
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !92
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !93
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !94
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !97
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !98
  call void @printLine(i8* %arraydecay4), !dbg !99
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !100
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !100
  call void @printLine(i8* %1), !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !103 {
entry:
  ret i32 0, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !105 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %call = call i32 @staticReturnsTrue(), !dbg !106
  %tobool = icmp ne i32 %call, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !109, metadata !DIExpression()), !dbg !112
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !113
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !114
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !115
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !115
  call void @printLine(i8* %0), !dbg !116
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !117
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !118
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !119
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !122
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !123
  call void @printLine(i8* %arraydecay4), !dbg !124
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !125
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !125
  call void @printLine(i8* %1), !dbg !126
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_08.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_08_bad", scope: !15, file: !15, line: 47, type: !16, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 49, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !14, file: !15, line: 49, column: 8)
!20 = !DILocation(line: 49, column: 8, scope: !14)
!21 = !DILocalVariable(name: "structCharVoid", scope: !22, file: !15, line: 52, type: !24)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 51, column: 9)
!23 = distinct !DILexicalBlock(scope: !19, file: !15, line: 50, column: 5)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !15, line: 30, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !15, line: 25, size: 256, elements: !26)
!26 = !{!27, !31, !32}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !25, file: !15, line: 27, baseType: !28, size: 128)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 16)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !25, file: !15, line: 28, baseType: !4, size: 64, offset: 128)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !25, file: !15, line: 29, baseType: !4, size: 64, offset: 192)
!33 = !DILocation(line: 52, column: 22, scope: !22)
!34 = !DILocation(line: 53, column: 28, scope: !22)
!35 = !DILocation(line: 53, column: 39, scope: !22)
!36 = !DILocation(line: 55, column: 46, scope: !22)
!37 = !DILocation(line: 55, column: 13, scope: !22)
!38 = !DILocation(line: 57, column: 35, scope: !22)
!39 = !DILocation(line: 57, column: 13, scope: !22)
!40 = !DILocation(line: 58, column: 28, scope: !22)
!41 = !DILocation(line: 58, column: 13, scope: !22)
!42 = !DILocation(line: 58, column: 89, scope: !22)
!43 = !DILocation(line: 59, column: 46, scope: !22)
!44 = !DILocation(line: 59, column: 31, scope: !22)
!45 = !DILocation(line: 59, column: 13, scope: !22)
!46 = !DILocation(line: 60, column: 46, scope: !22)
!47 = !DILocation(line: 60, column: 13, scope: !22)
!48 = !DILocation(line: 62, column: 5, scope: !23)
!49 = !DILocation(line: 63, column: 1, scope: !14)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_08_good", scope: !15, file: !15, line: 112, type: !16, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 114, column: 5, scope: !50)
!52 = !DILocation(line: 115, column: 5, scope: !50)
!53 = !DILocation(line: 116, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 127, type: !55, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !15, line: 127, type: !57)
!60 = !DILocation(line: 127, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !15, line: 127, type: !58)
!62 = !DILocation(line: 127, column: 27, scope: !54)
!63 = !DILocation(line: 130, column: 22, scope: !54)
!64 = !DILocation(line: 130, column: 12, scope: !54)
!65 = !DILocation(line: 130, column: 5, scope: !54)
!66 = !DILocation(line: 132, column: 5, scope: !54)
!67 = !DILocation(line: 133, column: 5, scope: !54)
!68 = !DILocation(line: 134, column: 5, scope: !54)
!69 = !DILocation(line: 137, column: 5, scope: !54)
!70 = !DILocation(line: 138, column: 5, scope: !54)
!71 = !DILocation(line: 139, column: 5, scope: !54)
!72 = !DILocation(line: 141, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 35, type: !74, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!57}
!76 = !DILocation(line: 37, column: 5, scope: !73)
!77 = distinct !DISubprogram(name: "good1", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 72, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !77, file: !15, line: 72, column: 8)
!80 = !DILocation(line: 72, column: 8, scope: !77)
!81 = !DILocation(line: 75, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !15, line: 73, column: 5)
!83 = !DILocation(line: 76, column: 5, scope: !82)
!84 = !DILocalVariable(name: "structCharVoid", scope: !85, file: !15, line: 80, type: !24)
!85 = distinct !DILexicalBlock(scope: !86, file: !15, line: 79, column: 9)
!86 = distinct !DILexicalBlock(scope: !79, file: !15, line: 78, column: 5)
!87 = !DILocation(line: 80, column: 22, scope: !85)
!88 = !DILocation(line: 81, column: 28, scope: !85)
!89 = !DILocation(line: 81, column: 39, scope: !85)
!90 = !DILocation(line: 83, column: 46, scope: !85)
!91 = !DILocation(line: 83, column: 13, scope: !85)
!92 = !DILocation(line: 85, column: 35, scope: !85)
!93 = !DILocation(line: 85, column: 13, scope: !85)
!94 = !DILocation(line: 86, column: 28, scope: !85)
!95 = !DILocation(line: 86, column: 13, scope: !85)
!96 = !DILocation(line: 86, column: 89, scope: !85)
!97 = !DILocation(line: 87, column: 46, scope: !85)
!98 = !DILocation(line: 87, column: 31, scope: !85)
!99 = !DILocation(line: 87, column: 13, scope: !85)
!100 = !DILocation(line: 88, column: 46, scope: !85)
!101 = !DILocation(line: 88, column: 13, scope: !85)
!102 = !DILocation(line: 91, column: 1, scope: !77)
!103 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 40, type: !74, scopeLine: 41, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocation(line: 42, column: 5, scope: !103)
!105 = distinct !DISubprogram(name: "good2", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 96, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !105, file: !15, line: 96, column: 8)
!108 = !DILocation(line: 96, column: 8, scope: !105)
!109 = !DILocalVariable(name: "structCharVoid", scope: !110, file: !15, line: 99, type: !24)
!110 = distinct !DILexicalBlock(scope: !111, file: !15, line: 98, column: 9)
!111 = distinct !DILexicalBlock(scope: !107, file: !15, line: 97, column: 5)
!112 = !DILocation(line: 99, column: 22, scope: !110)
!113 = !DILocation(line: 100, column: 28, scope: !110)
!114 = !DILocation(line: 100, column: 39, scope: !110)
!115 = !DILocation(line: 102, column: 46, scope: !110)
!116 = !DILocation(line: 102, column: 13, scope: !110)
!117 = !DILocation(line: 104, column: 35, scope: !110)
!118 = !DILocation(line: 104, column: 13, scope: !110)
!119 = !DILocation(line: 105, column: 28, scope: !110)
!120 = !DILocation(line: 105, column: 13, scope: !110)
!121 = !DILocation(line: 105, column: 89, scope: !110)
!122 = !DILocation(line: 106, column: 46, scope: !110)
!123 = !DILocation(line: 106, column: 31, scope: !110)
!124 = !DILocation(line: 106, column: 13, scope: !110)
!125 = !DILocation(line: 107, column: 46, scope: !110)
!126 = !DILocation(line: 107, column: 13, scope: !110)
!127 = !DILocation(line: 109, column: 5, scope: !111)
!128 = !DILocation(line: 110, column: 1, scope: !105)
