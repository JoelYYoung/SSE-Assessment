; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_07_bad() #0 !dbg !22 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 400, align 16, !dbg !29
  %1 = bitcast i8* %0 to i64*, !dbg !30
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = alloca i8, i64 800, align 16, !dbg !33
  %3 = bitcast i8* %2 to i64*, !dbg !34
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !32
  %4 = load i32, i32* @staticFive, align 4, !dbg !35
  %cmp = icmp eq i32 %4, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !39
  store i64* %5, i64** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !48
  %7 = load i64*, i64** %data, align 8, !dbg !49
  %8 = bitcast i64* %7 to i8*, !dbg !50
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !50
  %9 = bitcast i64* %arraydecay to i8*, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !50
  %10 = load i64*, i64** %data, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !51
  %11 = load i64, i64* %arrayidx, align 8, !dbg !51
  call void @printLongLongLine(i64 %11), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_07_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_07_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_07_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 400, align 16, !dbg !83
  %1 = bitcast i8* %0 to i64*, !dbg !84
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = alloca i8, i64 800, align 16, !dbg !87
  %3 = bitcast i8* %2 to i64*, !dbg !88
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !86
  %4 = load i32, i32* @staticFive, align 4, !dbg !89
  %cmp = icmp ne i32 %4, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !96
  store i64* %5, i64** %data, align 8, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !101
  %7 = load i64*, i64** %data, align 8, !dbg !102
  %8 = bitcast i64* %7 to i8*, !dbg !103
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !103
  %9 = bitcast i64* %arraydecay to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !103
  %10 = load i64*, i64** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !104
  %11 = load i64, i64* %arrayidx, align 8, !dbg !104
  call void @printLongLongLine(i64 %11), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 400, align 16, !dbg !112
  %1 = bitcast i8* %0 to i64*, !dbg !113
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %2 = alloca i8, i64 800, align 16, !dbg !116
  %3 = bitcast i8* %2 to i64*, !dbg !117
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !115
  %4 = load i32, i32* @staticFive, align 4, !dbg !118
  %cmp = icmp eq i32 %4, 5, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !122
  store i64* %5, i64** %data, align 8, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !128
  %7 = load i64*, i64** %data, align 8, !dbg !129
  %8 = bitcast i64* %7 to i8*, !dbg !130
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !130
  %9 = bitcast i64* %arraydecay to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !130
  %10 = load i64*, i64** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !131
  %11 = load i64, i64* %arrayidx, align 8, !dbg !131
  call void @printLongLongLine(i64 %11), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !14, line: 23, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 43, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0}
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_07.c", directory: "/root/SSE-Assessment")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_07_bad", scope: !14, file: !14, line: 27, type: !23, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !14, line: 29, type: !6)
!26 = !DILocation(line: 29, column: 15, scope: !22)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !22, file: !14, line: 30, type: !6)
!28 = !DILocation(line: 30, column: 15, scope: !22)
!29 = !DILocation(line: 30, column: 42, scope: !22)
!30 = !DILocation(line: 30, column: 31, scope: !22)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !22, file: !14, line: 31, type: !6)
!32 = !DILocation(line: 31, column: 15, scope: !22)
!33 = !DILocation(line: 31, column: 43, scope: !22)
!34 = !DILocation(line: 31, column: 32, scope: !22)
!35 = !DILocation(line: 32, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !22, file: !14, line: 32, column: 8)
!37 = !DILocation(line: 32, column: 18, scope: !36)
!38 = !DILocation(line: 32, column: 8, scope: !22)
!39 = !DILocation(line: 36, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !14, line: 33, column: 5)
!41 = !DILocation(line: 36, column: 14, scope: !40)
!42 = !DILocation(line: 37, column: 5, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 39, type: !45)
!44 = distinct !DILexicalBlock(scope: !22, file: !14, line: 38, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 39, column: 17, scope: !44)
!49 = !DILocation(line: 41, column: 16, scope: !44)
!50 = !DILocation(line: 41, column: 9, scope: !44)
!51 = !DILocation(line: 42, column: 27, scope: !44)
!52 = !DILocation(line: 42, column: 9, scope: !44)
!53 = !DILocation(line: 44, column: 1, scope: !22)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_07_good", scope: !14, file: !14, line: 93, type: !23, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 95, column: 5, scope: !54)
!56 = !DILocation(line: 96, column: 5, scope: !54)
!57 = !DILocation(line: 97, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 109, type: !59, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!15, !15, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !14, line: 109, type: !15)
!65 = !DILocation(line: 109, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !14, line: 109, type: !61)
!67 = !DILocation(line: 109, column: 27, scope: !58)
!68 = !DILocation(line: 112, column: 22, scope: !58)
!69 = !DILocation(line: 112, column: 12, scope: !58)
!70 = !DILocation(line: 112, column: 5, scope: !58)
!71 = !DILocation(line: 114, column: 5, scope: !58)
!72 = !DILocation(line: 115, column: 5, scope: !58)
!73 = !DILocation(line: 116, column: 5, scope: !58)
!74 = !DILocation(line: 119, column: 5, scope: !58)
!75 = !DILocation(line: 120, column: 5, scope: !58)
!76 = !DILocation(line: 121, column: 5, scope: !58)
!77 = !DILocation(line: 123, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !23, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !14, line: 53, type: !6)
!80 = !DILocation(line: 53, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !14, line: 54, type: !6)
!82 = !DILocation(line: 54, column: 15, scope: !78)
!83 = !DILocation(line: 54, column: 42, scope: !78)
!84 = !DILocation(line: 54, column: 31, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !14, line: 55, type: !6)
!86 = !DILocation(line: 55, column: 15, scope: !78)
!87 = !DILocation(line: 55, column: 43, scope: !78)
!88 = !DILocation(line: 55, column: 32, scope: !78)
!89 = !DILocation(line: 56, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !14, line: 56, column: 8)
!91 = !DILocation(line: 56, column: 18, scope: !90)
!92 = !DILocation(line: 56, column: 8, scope: !78)
!93 = !DILocation(line: 59, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !14, line: 57, column: 5)
!95 = !DILocation(line: 60, column: 5, scope: !94)
!96 = !DILocation(line: 64, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !14, line: 62, column: 5)
!98 = !DILocation(line: 64, column: 14, scope: !97)
!99 = !DILocalVariable(name: "source", scope: !100, file: !14, line: 67, type: !45)
!100 = distinct !DILexicalBlock(scope: !78, file: !14, line: 66, column: 5)
!101 = !DILocation(line: 67, column: 17, scope: !100)
!102 = !DILocation(line: 69, column: 16, scope: !100)
!103 = !DILocation(line: 69, column: 9, scope: !100)
!104 = !DILocation(line: 70, column: 27, scope: !100)
!105 = !DILocation(line: 70, column: 9, scope: !100)
!106 = !DILocation(line: 72, column: 1, scope: !78)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 75, type: !23, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !14, line: 77, type: !6)
!109 = !DILocation(line: 77, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !14, line: 78, type: !6)
!111 = !DILocation(line: 78, column: 15, scope: !107)
!112 = !DILocation(line: 78, column: 42, scope: !107)
!113 = !DILocation(line: 78, column: 31, scope: !107)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !14, line: 79, type: !6)
!115 = !DILocation(line: 79, column: 15, scope: !107)
!116 = !DILocation(line: 79, column: 43, scope: !107)
!117 = !DILocation(line: 79, column: 32, scope: !107)
!118 = !DILocation(line: 80, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !14, line: 80, column: 8)
!120 = !DILocation(line: 80, column: 18, scope: !119)
!121 = !DILocation(line: 80, column: 8, scope: !107)
!122 = !DILocation(line: 83, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !14, line: 81, column: 5)
!124 = !DILocation(line: 83, column: 14, scope: !123)
!125 = !DILocation(line: 84, column: 5, scope: !123)
!126 = !DILocalVariable(name: "source", scope: !127, file: !14, line: 86, type: !45)
!127 = distinct !DILexicalBlock(scope: !107, file: !14, line: 85, column: 5)
!128 = !DILocation(line: 86, column: 17, scope: !127)
!129 = !DILocation(line: 88, column: 16, scope: !127)
!130 = !DILocation(line: 88, column: 9, scope: !127)
!131 = !DILocation(line: 89, column: 27, scope: !127)
!132 = !DILocation(line: 89, column: 9, scope: !127)
!133 = !DILocation(line: 91, column: 1, scope: !107)
