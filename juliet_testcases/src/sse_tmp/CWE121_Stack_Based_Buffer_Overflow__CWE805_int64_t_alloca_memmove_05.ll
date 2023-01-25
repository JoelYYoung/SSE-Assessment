; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !14
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_05_bad() #0 !dbg !24 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to i64*, !dbg !32
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = alloca i8, i64 800, align 16, !dbg !35
  %3 = bitcast i8* %2 to i64*, !dbg !36
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !34
  %4 = load i32, i32* @staticTrue, align 4, !dbg !37
  %tobool = icmp ne i32 %4, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !40
  store i64* %5, i64** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !49
  %7 = load i64*, i64** %data, align 8, !dbg !50
  %8 = bitcast i64* %7 to i8*, !dbg !51
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !51
  %9 = bitcast i64* %arraydecay to i8*, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !51
  %10 = load i64*, i64** %data, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !52
  %11 = load i64, i64* %arrayidx, align 8, !dbg !52
  call void @printLongLongLine(i64 %11), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_05_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_05_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_05_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 400, align 16, !dbg !84
  %1 = bitcast i8* %0 to i64*, !dbg !85
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %2 = alloca i8, i64 800, align 16, !dbg !88
  %3 = bitcast i8* %2 to i64*, !dbg !89
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !87
  %4 = load i32, i32* @staticFalse, align 4, !dbg !90
  %tobool = icmp ne i32 %4, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !103
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
  %4 = load i32, i32* @staticTrue, align 4, !dbg !118
  %tobool = icmp ne i32 %4, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !121
  store i64* %5, i64** %data, align 8, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !127
  %7 = load i64*, i64** %data, align 8, !dbg !128
  %8 = bitcast i64* %7 to i8*, !dbg !129
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !129
  %9 = bitcast i64* %arraydecay to i8*, !dbg !129
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !129
  %10 = load i64*, i64** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !130
  %11 = load i64, i64* %arrayidx, align 8, !dbg !130
  call void @printLongLongLine(i64 %11), !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !16, line: 23, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 44, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !16, line: 24, type: !17, isLocal: true, isDefinition: true)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_05_bad", scope: !16, file: !16, line: 28, type: !25, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !16, line: 30, type: !6)
!28 = !DILocation(line: 30, column: 15, scope: !24)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !24, file: !16, line: 31, type: !6)
!30 = !DILocation(line: 31, column: 15, scope: !24)
!31 = !DILocation(line: 31, column: 42, scope: !24)
!32 = !DILocation(line: 31, column: 31, scope: !24)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !24, file: !16, line: 32, type: !6)
!34 = !DILocation(line: 32, column: 15, scope: !24)
!35 = !DILocation(line: 32, column: 43, scope: !24)
!36 = !DILocation(line: 32, column: 32, scope: !24)
!37 = !DILocation(line: 33, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !24, file: !16, line: 33, column: 8)
!39 = !DILocation(line: 33, column: 8, scope: !24)
!40 = !DILocation(line: 37, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !16, line: 34, column: 5)
!42 = !DILocation(line: 37, column: 14, scope: !41)
!43 = !DILocation(line: 38, column: 5, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !16, line: 40, type: !46)
!45 = distinct !DILexicalBlock(scope: !24, file: !16, line: 39, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 40, column: 17, scope: !45)
!50 = !DILocation(line: 42, column: 17, scope: !45)
!51 = !DILocation(line: 42, column: 9, scope: !45)
!52 = !DILocation(line: 43, column: 27, scope: !45)
!53 = !DILocation(line: 43, column: 9, scope: !45)
!54 = !DILocation(line: 45, column: 1, scope: !24)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_05_good", scope: !16, file: !16, line: 94, type: !25, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 96, column: 5, scope: !55)
!57 = !DILocation(line: 97, column: 5, scope: !55)
!58 = !DILocation(line: 98, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 110, type: !60, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!17, !17, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !16, line: 110, type: !17)
!66 = !DILocation(line: 110, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !16, line: 110, type: !62)
!68 = !DILocation(line: 110, column: 27, scope: !59)
!69 = !DILocation(line: 113, column: 22, scope: !59)
!70 = !DILocation(line: 113, column: 12, scope: !59)
!71 = !DILocation(line: 113, column: 5, scope: !59)
!72 = !DILocation(line: 115, column: 5, scope: !59)
!73 = !DILocation(line: 116, column: 5, scope: !59)
!74 = !DILocation(line: 117, column: 5, scope: !59)
!75 = !DILocation(line: 120, column: 5, scope: !59)
!76 = !DILocation(line: 121, column: 5, scope: !59)
!77 = !DILocation(line: 122, column: 5, scope: !59)
!78 = !DILocation(line: 124, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 52, type: !25, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !16, line: 54, type: !6)
!81 = !DILocation(line: 54, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !16, line: 55, type: !6)
!83 = !DILocation(line: 55, column: 15, scope: !79)
!84 = !DILocation(line: 55, column: 42, scope: !79)
!85 = !DILocation(line: 55, column: 31, scope: !79)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !16, line: 56, type: !6)
!87 = !DILocation(line: 56, column: 15, scope: !79)
!88 = !DILocation(line: 56, column: 43, scope: !79)
!89 = !DILocation(line: 56, column: 32, scope: !79)
!90 = !DILocation(line: 57, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !79, file: !16, line: 57, column: 8)
!92 = !DILocation(line: 57, column: 8, scope: !79)
!93 = !DILocation(line: 60, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !16, line: 58, column: 5)
!95 = !DILocation(line: 61, column: 5, scope: !94)
!96 = !DILocation(line: 65, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !16, line: 63, column: 5)
!98 = !DILocation(line: 65, column: 14, scope: !97)
!99 = !DILocalVariable(name: "source", scope: !100, file: !16, line: 68, type: !46)
!100 = distinct !DILexicalBlock(scope: !79, file: !16, line: 67, column: 5)
!101 = !DILocation(line: 68, column: 17, scope: !100)
!102 = !DILocation(line: 70, column: 17, scope: !100)
!103 = !DILocation(line: 70, column: 9, scope: !100)
!104 = !DILocation(line: 71, column: 27, scope: !100)
!105 = !DILocation(line: 71, column: 9, scope: !100)
!106 = !DILocation(line: 73, column: 1, scope: !79)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 76, type: !25, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !16, line: 78, type: !6)
!109 = !DILocation(line: 78, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !16, line: 79, type: !6)
!111 = !DILocation(line: 79, column: 15, scope: !107)
!112 = !DILocation(line: 79, column: 42, scope: !107)
!113 = !DILocation(line: 79, column: 31, scope: !107)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !16, line: 80, type: !6)
!115 = !DILocation(line: 80, column: 15, scope: !107)
!116 = !DILocation(line: 80, column: 43, scope: !107)
!117 = !DILocation(line: 80, column: 32, scope: !107)
!118 = !DILocation(line: 81, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !16, line: 81, column: 8)
!120 = !DILocation(line: 81, column: 8, scope: !107)
!121 = !DILocation(line: 84, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !16, line: 82, column: 5)
!123 = !DILocation(line: 84, column: 14, scope: !122)
!124 = !DILocation(line: 85, column: 5, scope: !122)
!125 = !DILocalVariable(name: "source", scope: !126, file: !16, line: 87, type: !46)
!126 = distinct !DILexicalBlock(scope: !107, file: !16, line: 86, column: 5)
!127 = !DILocation(line: 87, column: 17, scope: !126)
!128 = !DILocation(line: 89, column: 17, scope: !126)
!129 = !DILocation(line: 89, column: 9, scope: !126)
!130 = !DILocation(line: 90, column: 27, scope: !126)
!131 = !DILocation(line: 90, column: 9, scope: !126)
!132 = !DILocation(line: 92, column: 1, scope: !107)
