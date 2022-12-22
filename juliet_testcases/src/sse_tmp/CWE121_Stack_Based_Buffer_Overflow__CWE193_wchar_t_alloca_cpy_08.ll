; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_bad.source to i8*), i64 44, i1 false), !dbg !43
  %7 = load i32*, i32** %data, align 8, !dbg !44
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %call1 = call i32* @wcscpy(i32* %7, i32* %arraydecay) #5, !dbg !46
  %8 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %8), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_good() #0 !dbg !50 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 40, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = alloca i8, i64 44, align 16, !dbg !87
  %3 = bitcast i8* %2 to i32*, !dbg !88
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !86
  %call = call i32 @staticReturnsFalse(), !dbg !89
  %tobool = icmp ne i32 %call, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !95
  store i32* %4, i32** %data, align 8, !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !102
  %7 = load i32*, i32** %data, align 8, !dbg !103
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !104
  %call1 = call i32* @wcscpy(i32* %7, i32* %arraydecay) #5, !dbg !105
  %8 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %8), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !109 {
entry:
  ret i32 0, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 40, align 16, !dbg !116
  %1 = bitcast i8* %0 to i32*, !dbg !117
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %2 = alloca i8, i64 44, align 16, !dbg !120
  %3 = bitcast i8* %2 to i32*, !dbg !121
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !119
  %call = call i32 @staticReturnsTrue(), !dbg !122
  %tobool = icmp ne i32 %call, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !125
  store i32* %4, i32** %data, align 8, !dbg !127
  %5 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  br label %if.end, !dbg !130

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !133
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !134
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !135
  %call1 = call i32* @wcscpy(i32* %7, i32* %arraydecay) #5, !dbg !136
  %8 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %8), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_bad", scope: !16, file: !16, line: 42, type: !17, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 44, type: !4)
!20 = !DILocation(line: 44, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 45, type: !4)
!22 = !DILocation(line: 45, column: 15, scope: !15)
!23 = !DILocation(line: 45, column: 42, scope: !15)
!24 = !DILocation(line: 45, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 46, type: !4)
!26 = !DILocation(line: 46, column: 15, scope: !15)
!27 = !DILocation(line: 46, column: 43, scope: !15)
!28 = !DILocation(line: 46, column: 32, scope: !15)
!29 = !DILocation(line: 47, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 47, column: 8)
!31 = !DILocation(line: 47, column: 8, scope: !15)
!32 = !DILocation(line: 51, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 48, column: 5)
!34 = !DILocation(line: 51, column: 14, scope: !33)
!35 = !DILocation(line: 52, column: 9, scope: !33)
!36 = !DILocation(line: 52, column: 17, scope: !33)
!37 = !DILocation(line: 53, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 55, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 54, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DILocation(line: 55, column: 17, scope: !39)
!44 = !DILocation(line: 57, column: 16, scope: !39)
!45 = !DILocation(line: 57, column: 22, scope: !39)
!46 = !DILocation(line: 57, column: 9, scope: !39)
!47 = !DILocation(line: 58, column: 20, scope: !39)
!48 = !DILocation(line: 58, column: 9, scope: !39)
!49 = !DILocation(line: 60, column: 1, scope: !15)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_good", scope: !16, file: !16, line: 113, type: !17, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 115, column: 5, scope: !50)
!52 = !DILocation(line: 116, column: 5, scope: !50)
!53 = !DILocation(line: 117, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 129, type: !55, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !16, line: 129, type: !7)
!61 = !DILocation(line: 129, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !16, line: 129, type: !57)
!63 = !DILocation(line: 129, column: 27, scope: !54)
!64 = !DILocation(line: 132, column: 22, scope: !54)
!65 = !DILocation(line: 132, column: 12, scope: !54)
!66 = !DILocation(line: 132, column: 5, scope: !54)
!67 = !DILocation(line: 134, column: 5, scope: !54)
!68 = !DILocation(line: 135, column: 5, scope: !54)
!69 = !DILocation(line: 136, column: 5, scope: !54)
!70 = !DILocation(line: 139, column: 5, scope: !54)
!71 = !DILocation(line: 140, column: 5, scope: !54)
!72 = !DILocation(line: 141, column: 5, scope: !54)
!73 = !DILocation(line: 143, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 30, type: !75, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!7}
!77 = !DILocation(line: 32, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 67, type: !17, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !16, line: 69, type: !4)
!80 = !DILocation(line: 69, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !16, line: 70, type: !4)
!82 = !DILocation(line: 70, column: 15, scope: !78)
!83 = !DILocation(line: 70, column: 42, scope: !78)
!84 = !DILocation(line: 70, column: 31, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !16, line: 71, type: !4)
!86 = !DILocation(line: 71, column: 15, scope: !78)
!87 = !DILocation(line: 71, column: 43, scope: !78)
!88 = !DILocation(line: 71, column: 32, scope: !78)
!89 = !DILocation(line: 72, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !16, line: 72, column: 8)
!91 = !DILocation(line: 72, column: 8, scope: !78)
!92 = !DILocation(line: 75, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !16, line: 73, column: 5)
!94 = !DILocation(line: 76, column: 5, scope: !93)
!95 = !DILocation(line: 81, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !16, line: 78, column: 5)
!97 = !DILocation(line: 81, column: 14, scope: !96)
!98 = !DILocation(line: 82, column: 9, scope: !96)
!99 = !DILocation(line: 82, column: 17, scope: !96)
!100 = !DILocalVariable(name: "source", scope: !101, file: !16, line: 85, type: !40)
!101 = distinct !DILexicalBlock(scope: !78, file: !16, line: 84, column: 5)
!102 = !DILocation(line: 85, column: 17, scope: !101)
!103 = !DILocation(line: 87, column: 16, scope: !101)
!104 = !DILocation(line: 87, column: 22, scope: !101)
!105 = !DILocation(line: 87, column: 9, scope: !101)
!106 = !DILocation(line: 88, column: 20, scope: !101)
!107 = !DILocation(line: 88, column: 9, scope: !101)
!108 = !DILocation(line: 90, column: 1, scope: !78)
!109 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 35, type: !75, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocation(line: 37, column: 5, scope: !109)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !16, line: 95, type: !4)
!113 = !DILocation(line: 95, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !16, line: 96, type: !4)
!115 = !DILocation(line: 96, column: 15, scope: !111)
!116 = !DILocation(line: 96, column: 42, scope: !111)
!117 = !DILocation(line: 96, column: 31, scope: !111)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !16, line: 97, type: !4)
!119 = !DILocation(line: 97, column: 15, scope: !111)
!120 = !DILocation(line: 97, column: 43, scope: !111)
!121 = !DILocation(line: 97, column: 32, scope: !111)
!122 = !DILocation(line: 98, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !111, file: !16, line: 98, column: 8)
!124 = !DILocation(line: 98, column: 8, scope: !111)
!125 = !DILocation(line: 102, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !16, line: 99, column: 5)
!127 = !DILocation(line: 102, column: 14, scope: !126)
!128 = !DILocation(line: 103, column: 9, scope: !126)
!129 = !DILocation(line: 103, column: 17, scope: !126)
!130 = !DILocation(line: 104, column: 5, scope: !126)
!131 = !DILocalVariable(name: "source", scope: !132, file: !16, line: 106, type: !40)
!132 = distinct !DILexicalBlock(scope: !111, file: !16, line: 105, column: 5)
!133 = !DILocation(line: 106, column: 17, scope: !132)
!134 = !DILocation(line: 108, column: 16, scope: !132)
!135 = !DILocation(line: 108, column: 22, scope: !132)
!136 = !DILocation(line: 108, column: 9, scope: !132)
!137 = !DILocation(line: 109, column: 20, scope: !132)
!138 = !DILocation(line: 109, column: 9, scope: !132)
!139 = !DILocation(line: 111, column: 1, scope: !111)
