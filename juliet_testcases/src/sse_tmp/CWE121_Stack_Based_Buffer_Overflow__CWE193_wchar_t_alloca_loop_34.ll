; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_unionType = type { i32* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 40, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 44, align 16, !dbg !34
  %3 = bitcast i8* %2 to i32*, !dbg !35
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %4, i32** %data, align 8, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !41
  store i32* %6, i32** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !46
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !46
  store i32* %7, i32** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_bad.source to i8*), i64 44, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !57, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !59
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !60
  store i64 %call, i64* %sourceLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !65
  %10 = load i64, i64* %sourceLen, align 8, !dbg !67
  %add = add i64 %10, 1, !dbg !68
  %cmp = icmp ult i64 %9, %add, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %11, !dbg !73
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !73
  %13 = load i32*, i32** %data1, align 8, !dbg !74
  %14 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !74
  store i32 %12, i32* %arrayidx3, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %15, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %data1, align 8, !dbg !83
  call void @printWLine(i32* %16), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #7, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #7, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_unionType* %myUnion, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 40, align 16, !dbg !116
  %1 = bitcast i8* %0 to i32*, !dbg !117
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %2 = alloca i8, i64 44, align 16, !dbg !120
  %3 = bitcast i8* %2 to i32*, !dbg !121
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !119
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !122
  store i32* %4, i32** %data, align 8, !dbg !123
  %5 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %6 = load i32*, i32** %data, align 8, !dbg !126
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !127
  store i32* %6, i32** %unionFirst, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !129, metadata !DIExpression()), !dbg !131
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !132
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !132
  store i32* %7, i32** %data1, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !135
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !140
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !141
  store i64 %call, i64* %sourceLen, align 8, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !146
  %10 = load i64, i64* %sourceLen, align 8, !dbg !148
  %add = add i64 %10, 1, !dbg !149
  %cmp = icmp ult i64 %9, %add, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %11, !dbg !154
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !154
  %13 = load i32*, i32** %data1, align 8, !dbg !155
  %14 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !155
  store i32 %12, i32* %arrayidx3, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %15, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %data1, align 8, !dbg !163
  call void @printWLine(i32* %16), !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_bad", scope: !16, file: !16, line: 34, type: !17, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 36, type: !4)
!20 = !DILocation(line: 36, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 37, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_unionType", file: !16, line: 30, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 26, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 28, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 29, baseType: !4, size: 64)
!27 = !DILocation(line: 37, column: 81, scope: !15)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 38, type: !4)
!29 = !DILocation(line: 38, column: 15, scope: !15)
!30 = !DILocation(line: 38, column: 42, scope: !15)
!31 = !DILocation(line: 38, column: 31, scope: !15)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 39, type: !4)
!33 = !DILocation(line: 39, column: 15, scope: !15)
!34 = !DILocation(line: 39, column: 43, scope: !15)
!35 = !DILocation(line: 39, column: 32, scope: !15)
!36 = !DILocation(line: 42, column: 12, scope: !15)
!37 = !DILocation(line: 42, column: 10, scope: !15)
!38 = !DILocation(line: 43, column: 5, scope: !15)
!39 = !DILocation(line: 43, column: 13, scope: !15)
!40 = !DILocation(line: 44, column: 26, scope: !15)
!41 = !DILocation(line: 44, column: 13, scope: !15)
!42 = !DILocation(line: 44, column: 24, scope: !15)
!43 = !DILocalVariable(name: "data", scope: !44, file: !16, line: 46, type: !4)
!44 = distinct !DILexicalBlock(scope: !15, file: !16, line: 45, column: 5)
!45 = !DILocation(line: 46, column: 19, scope: !44)
!46 = !DILocation(line: 46, column: 34, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !16, line: 48, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !16, line: 47, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 48, column: 21, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !48, file: !16, line: 49, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !55)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 49, column: 20, scope: !48)
!57 = !DILocalVariable(name: "sourceLen", scope: !48, file: !16, line: 49, type: !54)
!58 = !DILocation(line: 49, column: 23, scope: !48)
!59 = !DILocation(line: 50, column: 32, scope: !48)
!60 = !DILocation(line: 50, column: 25, scope: !48)
!61 = !DILocation(line: 50, column: 23, scope: !48)
!62 = !DILocation(line: 53, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !48, file: !16, line: 53, column: 13)
!64 = !DILocation(line: 53, column: 18, scope: !63)
!65 = !DILocation(line: 53, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !16, line: 53, column: 13)
!67 = !DILocation(line: 53, column: 29, scope: !66)
!68 = !DILocation(line: 53, column: 39, scope: !66)
!69 = !DILocation(line: 53, column: 27, scope: !66)
!70 = !DILocation(line: 53, column: 13, scope: !63)
!71 = !DILocation(line: 55, column: 34, scope: !72)
!72 = distinct !DILexicalBlock(scope: !66, file: !16, line: 54, column: 13)
!73 = !DILocation(line: 55, column: 27, scope: !72)
!74 = !DILocation(line: 55, column: 17, scope: !72)
!75 = !DILocation(line: 55, column: 22, scope: !72)
!76 = !DILocation(line: 55, column: 25, scope: !72)
!77 = !DILocation(line: 56, column: 13, scope: !72)
!78 = !DILocation(line: 53, column: 45, scope: !66)
!79 = !DILocation(line: 53, column: 13, scope: !66)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 56, column: 13, scope: !63)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 57, column: 24, scope: !48)
!84 = !DILocation(line: 57, column: 13, scope: !48)
!85 = !DILocation(line: 60, column: 1, scope: !15)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_34_good", scope: !16, file: !16, line: 95, type: !17, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 97, column: 5, scope: !86)
!88 = !DILocation(line: 98, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 109, type: !90, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!7, !7, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !16, line: 109, type: !7)
!96 = !DILocation(line: 109, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !16, line: 109, type: !92)
!98 = !DILocation(line: 109, column: 27, scope: !89)
!99 = !DILocation(line: 112, column: 22, scope: !89)
!100 = !DILocation(line: 112, column: 12, scope: !89)
!101 = !DILocation(line: 112, column: 5, scope: !89)
!102 = !DILocation(line: 114, column: 5, scope: !89)
!103 = !DILocation(line: 115, column: 5, scope: !89)
!104 = !DILocation(line: 116, column: 5, scope: !89)
!105 = !DILocation(line: 119, column: 5, scope: !89)
!106 = !DILocation(line: 120, column: 5, scope: !89)
!107 = !DILocation(line: 121, column: 5, scope: !89)
!108 = !DILocation(line: 123, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 67, type: !17, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !16, line: 69, type: !4)
!111 = !DILocation(line: 69, column: 15, scope: !109)
!112 = !DILocalVariable(name: "myUnion", scope: !109, file: !16, line: 70, type: !22)
!113 = !DILocation(line: 70, column: 81, scope: !109)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !16, line: 71, type: !4)
!115 = !DILocation(line: 71, column: 15, scope: !109)
!116 = !DILocation(line: 71, column: 42, scope: !109)
!117 = !DILocation(line: 71, column: 31, scope: !109)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !16, line: 72, type: !4)
!119 = !DILocation(line: 72, column: 15, scope: !109)
!120 = !DILocation(line: 72, column: 43, scope: !109)
!121 = !DILocation(line: 72, column: 32, scope: !109)
!122 = !DILocation(line: 75, column: 12, scope: !109)
!123 = !DILocation(line: 75, column: 10, scope: !109)
!124 = !DILocation(line: 76, column: 5, scope: !109)
!125 = !DILocation(line: 76, column: 13, scope: !109)
!126 = !DILocation(line: 77, column: 26, scope: !109)
!127 = !DILocation(line: 77, column: 13, scope: !109)
!128 = !DILocation(line: 77, column: 24, scope: !109)
!129 = !DILocalVariable(name: "data", scope: !130, file: !16, line: 79, type: !4)
!130 = distinct !DILexicalBlock(scope: !109, file: !16, line: 78, column: 5)
!131 = !DILocation(line: 79, column: 19, scope: !130)
!132 = !DILocation(line: 79, column: 34, scope: !130)
!133 = !DILocalVariable(name: "source", scope: !134, file: !16, line: 81, type: !49)
!134 = distinct !DILexicalBlock(scope: !130, file: !16, line: 80, column: 9)
!135 = !DILocation(line: 81, column: 21, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !134, file: !16, line: 82, type: !54)
!137 = !DILocation(line: 82, column: 20, scope: !134)
!138 = !DILocalVariable(name: "sourceLen", scope: !134, file: !16, line: 82, type: !54)
!139 = !DILocation(line: 82, column: 23, scope: !134)
!140 = !DILocation(line: 83, column: 32, scope: !134)
!141 = !DILocation(line: 83, column: 25, scope: !134)
!142 = !DILocation(line: 83, column: 23, scope: !134)
!143 = !DILocation(line: 86, column: 20, scope: !144)
!144 = distinct !DILexicalBlock(scope: !134, file: !16, line: 86, column: 13)
!145 = !DILocation(line: 86, column: 18, scope: !144)
!146 = !DILocation(line: 86, column: 25, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !16, line: 86, column: 13)
!148 = !DILocation(line: 86, column: 29, scope: !147)
!149 = !DILocation(line: 86, column: 39, scope: !147)
!150 = !DILocation(line: 86, column: 27, scope: !147)
!151 = !DILocation(line: 86, column: 13, scope: !144)
!152 = !DILocation(line: 88, column: 34, scope: !153)
!153 = distinct !DILexicalBlock(scope: !147, file: !16, line: 87, column: 13)
!154 = !DILocation(line: 88, column: 27, scope: !153)
!155 = !DILocation(line: 88, column: 17, scope: !153)
!156 = !DILocation(line: 88, column: 22, scope: !153)
!157 = !DILocation(line: 88, column: 25, scope: !153)
!158 = !DILocation(line: 89, column: 13, scope: !153)
!159 = !DILocation(line: 86, column: 45, scope: !147)
!160 = !DILocation(line: 86, column: 13, scope: !147)
!161 = distinct !{!161, !151, !162, !82}
!162 = !DILocation(line: 89, column: 13, scope: !144)
!163 = !DILocation(line: 90, column: 24, scope: !134)
!164 = !DILocation(line: 90, column: 13, scope: !134)
!165 = !DILocation(line: 93, column: 1, scope: !109)
