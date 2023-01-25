; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_bad() #0 !dbg !17 {
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
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !31
  %cmp = icmp eq i32 %4, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !35
  store i64* %5, i64** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !44
  %7 = load i64*, i64** %data, align 8, !dbg !45
  %8 = bitcast i64* %7 to i8*, !dbg !46
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !46
  %9 = bitcast i64* %arraydecay to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !46
  %10 = load i64*, i64** %data, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !47
  %11 = load i64, i64* %arrayidx, align 8, !dbg !47
  call void @printLongLongLine(i64 %11), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 400, align 16, !dbg !80
  %1 = bitcast i8* %0 to i64*, !dbg !81
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %2 = alloca i8, i64 800, align 16, !dbg !84
  %3 = bitcast i8* %2 to i64*, !dbg !85
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !83
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !86
  %cmp = icmp ne i32 %4, 5, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !93
  store i64* %5, i64** %data, align 8, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !98
  %7 = load i64*, i64** %data, align 8, !dbg !99
  %8 = bitcast i64* %7 to i8*, !dbg !100
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !100
  %9 = bitcast i64* %arraydecay to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !100
  %10 = load i64*, i64** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !101
  %11 = load i64, i64* %arrayidx, align 8, !dbg !101
  call void @printLongLongLine(i64 %11), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i64*, !dbg !110
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 800, align 16, !dbg !113
  %3 = bitcast i8* %2 to i64*, !dbg !114
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !112
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !115
  %cmp = icmp eq i32 %4, 5, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !119
  store i64* %5, i64** %data, align 8, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !125
  %7 = load i64*, i64** %data, align 8, !dbg !126
  %8 = bitcast i64* %7 to i8*, !dbg !127
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !127
  %9 = bitcast i64* %arraydecay to i8*, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !127
  %10 = load i64*, i64** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !128
  %11 = load i64, i64* %arrayidx, align 8, !dbg !128
  call void @printLongLongLine(i64 %11), !dbg !129
  ret void, !dbg !130
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 23, type: !4)
!22 = !DILocation(line: 23, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 24, type: !4)
!24 = !DILocation(line: 24, column: 15, scope: !17)
!25 = !DILocation(line: 24, column: 42, scope: !17)
!26 = !DILocation(line: 24, column: 31, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 25, type: !4)
!28 = !DILocation(line: 25, column: 15, scope: !17)
!29 = !DILocation(line: 25, column: 43, scope: !17)
!30 = !DILocation(line: 25, column: 32, scope: !17)
!31 = !DILocation(line: 26, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !17, file: !18, line: 26, column: 8)
!33 = !DILocation(line: 26, column: 25, scope: !32)
!34 = !DILocation(line: 26, column: 8, scope: !17)
!35 = !DILocation(line: 30, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !18, line: 27, column: 5)
!37 = !DILocation(line: 30, column: 14, scope: !36)
!38 = !DILocation(line: 31, column: 5, scope: !36)
!39 = !DILocalVariable(name: "source", scope: !40, file: !18, line: 33, type: !41)
!40 = distinct !DILexicalBlock(scope: !17, file: !18, line: 32, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 33, column: 17, scope: !40)
!45 = !DILocation(line: 35, column: 16, scope: !40)
!46 = !DILocation(line: 35, column: 9, scope: !40)
!47 = !DILocation(line: 36, column: 27, scope: !40)
!48 = !DILocation(line: 36, column: 9, scope: !40)
!49 = !DILocation(line: 38, column: 1, scope: !17)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_good", scope: !18, file: !18, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 89, column: 5, scope: !50)
!52 = !DILocation(line: 90, column: 5, scope: !50)
!53 = !DILocation(line: 91, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 103, type: !55, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !18, line: 103, type: !57)
!62 = !DILocation(line: 103, column: 14, scope: !54)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !18, line: 103, type: !58)
!64 = !DILocation(line: 103, column: 27, scope: !54)
!65 = !DILocation(line: 106, column: 22, scope: !54)
!66 = !DILocation(line: 106, column: 12, scope: !54)
!67 = !DILocation(line: 106, column: 5, scope: !54)
!68 = !DILocation(line: 108, column: 5, scope: !54)
!69 = !DILocation(line: 109, column: 5, scope: !54)
!70 = !DILocation(line: 110, column: 5, scope: !54)
!71 = !DILocation(line: 113, column: 5, scope: !54)
!72 = !DILocation(line: 114, column: 5, scope: !54)
!73 = !DILocation(line: 115, column: 5, scope: !54)
!74 = !DILocation(line: 117, column: 5, scope: !54)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 45, type: !19, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !18, line: 47, type: !4)
!77 = !DILocation(line: 47, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !18, line: 48, type: !4)
!79 = !DILocation(line: 48, column: 15, scope: !75)
!80 = !DILocation(line: 48, column: 42, scope: !75)
!81 = !DILocation(line: 48, column: 31, scope: !75)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !18, line: 49, type: !4)
!83 = !DILocation(line: 49, column: 15, scope: !75)
!84 = !DILocation(line: 49, column: 43, scope: !75)
!85 = !DILocation(line: 49, column: 32, scope: !75)
!86 = !DILocation(line: 50, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !75, file: !18, line: 50, column: 8)
!88 = !DILocation(line: 50, column: 25, scope: !87)
!89 = !DILocation(line: 50, column: 8, scope: !75)
!90 = !DILocation(line: 53, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !18, line: 51, column: 5)
!92 = !DILocation(line: 54, column: 5, scope: !91)
!93 = !DILocation(line: 58, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !18, line: 56, column: 5)
!95 = !DILocation(line: 58, column: 14, scope: !94)
!96 = !DILocalVariable(name: "source", scope: !97, file: !18, line: 61, type: !41)
!97 = distinct !DILexicalBlock(scope: !75, file: !18, line: 60, column: 5)
!98 = !DILocation(line: 61, column: 17, scope: !97)
!99 = !DILocation(line: 63, column: 16, scope: !97)
!100 = !DILocation(line: 63, column: 9, scope: !97)
!101 = !DILocation(line: 64, column: 27, scope: !97)
!102 = !DILocation(line: 64, column: 9, scope: !97)
!103 = !DILocation(line: 66, column: 1, scope: !75)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 69, type: !19, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !18, line: 71, type: !4)
!106 = !DILocation(line: 71, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !18, line: 72, type: !4)
!108 = !DILocation(line: 72, column: 15, scope: !104)
!109 = !DILocation(line: 72, column: 42, scope: !104)
!110 = !DILocation(line: 72, column: 31, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !18, line: 73, type: !4)
!112 = !DILocation(line: 73, column: 15, scope: !104)
!113 = !DILocation(line: 73, column: 43, scope: !104)
!114 = !DILocation(line: 73, column: 32, scope: !104)
!115 = !DILocation(line: 74, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !18, line: 74, column: 8)
!117 = !DILocation(line: 74, column: 25, scope: !116)
!118 = !DILocation(line: 74, column: 8, scope: !104)
!119 = !DILocation(line: 77, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !18, line: 75, column: 5)
!121 = !DILocation(line: 77, column: 14, scope: !120)
!122 = !DILocation(line: 78, column: 5, scope: !120)
!123 = !DILocalVariable(name: "source", scope: !124, file: !18, line: 80, type: !41)
!124 = distinct !DILexicalBlock(scope: !104, file: !18, line: 79, column: 5)
!125 = !DILocation(line: 80, column: 17, scope: !124)
!126 = !DILocation(line: 82, column: 16, scope: !124)
!127 = !DILocation(line: 82, column: 9, scope: !124)
!128 = !DILocation(line: 83, column: 27, scope: !124)
!129 = !DILocation(line: 83, column: 9, scope: !124)
!130 = !DILocation(line: 85, column: 1, scope: !104)
