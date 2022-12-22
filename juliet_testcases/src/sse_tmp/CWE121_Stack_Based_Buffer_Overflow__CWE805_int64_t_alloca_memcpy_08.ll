; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_08_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i64*, !dbg !26
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 800, align 16, !dbg !29
  %3 = bitcast i8* %2 to i64*, !dbg !30
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !28
  %call = call i32 @staticReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !34
  store i64* %4, i64** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !43
  %6 = load i64*, i64** %data, align 8, !dbg !44
  %7 = bitcast i64* %6 to i8*, !dbg !45
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !45
  %8 = bitcast i64* %arraydecay to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %8, i64 800, i1 false), !dbg !45
  %9 = load i64*, i64** %data, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !46
  %10 = load i64, i64* %arrayidx, align 8, !dbg !46
  call void @printLongLongLine(i64 %10), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_08_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_08_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_08_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

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
  %call = call i32 @staticReturnsFalse(), !dbg !89
  %tobool = icmp ne i32 %call, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !95
  store i64* %4, i64** %data, align 8, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !100
  %6 = load i64*, i64** %data, align 8, !dbg !101
  %7 = bitcast i64* %6 to i8*, !dbg !102
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !102
  %8 = bitcast i64* %arraydecay to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %8, i64 800, i1 false), !dbg !102
  %9 = load i64*, i64** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !103
  %10 = load i64, i64* %arrayidx, align 8, !dbg !103
  call void @printLongLongLine(i64 %10), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !106 {
entry:
  ret i32 0, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 400, align 16, !dbg !113
  %1 = bitcast i8* %0 to i64*, !dbg !114
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = alloca i8, i64 800, align 16, !dbg !117
  %3 = bitcast i8* %2 to i64*, !dbg !118
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !116
  %call = call i32 @staticReturnsTrue(), !dbg !119
  %tobool = icmp ne i32 %call, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !122
  store i64* %4, i64** %data, align 8, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !128
  %6 = load i64*, i64** %data, align 8, !dbg !129
  %7 = bitcast i64* %6 to i8*, !dbg !130
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !130
  %8 = bitcast i64* %arraydecay to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %8, i64 800, i1 false), !dbg !130
  %9 = load i64*, i64** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !131
  %10 = load i64, i64* %arrayidx, align 8, !dbg !131
  call void @printLongLongLine(i64 %10), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_08_bad", scope: !18, file: !18, line: 35, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_08.c", directory: "/root/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 37, type: !4)
!22 = !DILocation(line: 37, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 38, type: !4)
!24 = !DILocation(line: 38, column: 15, scope: !17)
!25 = !DILocation(line: 38, column: 42, scope: !17)
!26 = !DILocation(line: 38, column: 31, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 39, type: !4)
!28 = !DILocation(line: 39, column: 15, scope: !17)
!29 = !DILocation(line: 39, column: 43, scope: !17)
!30 = !DILocation(line: 39, column: 32, scope: !17)
!31 = !DILocation(line: 40, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !17, file: !18, line: 40, column: 8)
!33 = !DILocation(line: 40, column: 8, scope: !17)
!34 = !DILocation(line: 44, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !18, line: 41, column: 5)
!36 = !DILocation(line: 44, column: 14, scope: !35)
!37 = !DILocation(line: 45, column: 5, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !18, line: 47, type: !40)
!39 = distinct !DILexicalBlock(scope: !17, file: !18, line: 46, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 47, column: 17, scope: !39)
!44 = !DILocation(line: 49, column: 16, scope: !39)
!45 = !DILocation(line: 49, column: 9, scope: !39)
!46 = !DILocation(line: 50, column: 27, scope: !39)
!47 = !DILocation(line: 50, column: 9, scope: !39)
!48 = !DILocation(line: 52, column: 1, scope: !17)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_08_good", scope: !18, file: !18, line: 101, type: !19, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 103, column: 5, scope: !49)
!51 = !DILocation(line: 104, column: 5, scope: !49)
!52 = !DILocation(line: 105, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 117, type: !54, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !18, line: 117, type: !56)
!61 = !DILocation(line: 117, column: 14, scope: !53)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !18, line: 117, type: !57)
!63 = !DILocation(line: 117, column: 27, scope: !53)
!64 = !DILocation(line: 120, column: 22, scope: !53)
!65 = !DILocation(line: 120, column: 12, scope: !53)
!66 = !DILocation(line: 120, column: 5, scope: !53)
!67 = !DILocation(line: 122, column: 5, scope: !53)
!68 = !DILocation(line: 123, column: 5, scope: !53)
!69 = !DILocation(line: 124, column: 5, scope: !53)
!70 = !DILocation(line: 127, column: 5, scope: !53)
!71 = !DILocation(line: 128, column: 5, scope: !53)
!72 = !DILocation(line: 129, column: 5, scope: !53)
!73 = !DILocation(line: 131, column: 5, scope: !53)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !18, file: !18, line: 23, type: !75, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!56}
!77 = !DILocation(line: 25, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 59, type: !19, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !18, line: 61, type: !4)
!80 = !DILocation(line: 61, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !18, line: 62, type: !4)
!82 = !DILocation(line: 62, column: 15, scope: !78)
!83 = !DILocation(line: 62, column: 42, scope: !78)
!84 = !DILocation(line: 62, column: 31, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !18, line: 63, type: !4)
!86 = !DILocation(line: 63, column: 15, scope: !78)
!87 = !DILocation(line: 63, column: 43, scope: !78)
!88 = !DILocation(line: 63, column: 32, scope: !78)
!89 = !DILocation(line: 64, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !18, line: 64, column: 8)
!91 = !DILocation(line: 64, column: 8, scope: !78)
!92 = !DILocation(line: 67, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !18, line: 65, column: 5)
!94 = !DILocation(line: 68, column: 5, scope: !93)
!95 = !DILocation(line: 72, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !18, line: 70, column: 5)
!97 = !DILocation(line: 72, column: 14, scope: !96)
!98 = !DILocalVariable(name: "source", scope: !99, file: !18, line: 75, type: !40)
!99 = distinct !DILexicalBlock(scope: !78, file: !18, line: 74, column: 5)
!100 = !DILocation(line: 75, column: 17, scope: !99)
!101 = !DILocation(line: 77, column: 16, scope: !99)
!102 = !DILocation(line: 77, column: 9, scope: !99)
!103 = !DILocation(line: 78, column: 27, scope: !99)
!104 = !DILocation(line: 78, column: 9, scope: !99)
!105 = !DILocation(line: 80, column: 1, scope: !78)
!106 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !18, file: !18, line: 28, type: !75, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocation(line: 30, column: 5, scope: !106)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !18, line: 85, type: !4)
!110 = !DILocation(line: 85, column: 15, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !18, line: 86, type: !4)
!112 = !DILocation(line: 86, column: 15, scope: !108)
!113 = !DILocation(line: 86, column: 42, scope: !108)
!114 = !DILocation(line: 86, column: 31, scope: !108)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !18, line: 87, type: !4)
!116 = !DILocation(line: 87, column: 15, scope: !108)
!117 = !DILocation(line: 87, column: 43, scope: !108)
!118 = !DILocation(line: 87, column: 32, scope: !108)
!119 = !DILocation(line: 88, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !108, file: !18, line: 88, column: 8)
!121 = !DILocation(line: 88, column: 8, scope: !108)
!122 = !DILocation(line: 91, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !18, line: 89, column: 5)
!124 = !DILocation(line: 91, column: 14, scope: !123)
!125 = !DILocation(line: 92, column: 5, scope: !123)
!126 = !DILocalVariable(name: "source", scope: !127, file: !18, line: 94, type: !40)
!127 = distinct !DILexicalBlock(scope: !108, file: !18, line: 93, column: 5)
!128 = !DILocation(line: 94, column: 17, scope: !127)
!129 = !DILocation(line: 96, column: 16, scope: !127)
!130 = !DILocation(line: 96, column: 9, scope: !127)
!131 = !DILocation(line: 97, column: 27, scope: !127)
!132 = !DILocation(line: 97, column: 9, scope: !127)
!133 = !DILocation(line: 99, column: 1, scope: !108)
