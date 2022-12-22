; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 40, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 44, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %5 = load i32*, i32** %4, align 8, !dbg !38
  store i32* %5, i32** %data1, align 8, !dbg !36
  %6 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  store i32* %6, i32** %data1, align 8, !dbg !40
  %7 = load i32*, i32** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %8 = load i32*, i32** %data1, align 8, !dbg !43
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !44
  store i32* %8, i32** %9, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !49
  %11 = load i32*, i32** %10, align 8, !dbg !50
  store i32* %11, i32** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  %12 = bitcast [11 x i32]* %source to i8*, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %12, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32_bad.source to i8*), i64 44, i1 false), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i, metadata !57, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !61, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !63
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !64
  store i64 %call, i64* %sourceLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i64, i64* %i, align 8, !dbg !69
  %14 = load i64, i64* %sourceLen, align 8, !dbg !71
  %add = add i64 %14, 1, !dbg !72
  %cmp = icmp ult i64 %13, %add, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %15 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %15, !dbg !77
  %16 = load i32, i32* %arrayidx3, align 4, !dbg !77
  %17 = load i32*, i32** %data2, align 8, !dbg !78
  %18 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx4 = getelementptr inbounds i32, i32* %17, i64 %18, !dbg !78
  store i32 %16, i32* %arrayidx4, align 4, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %19, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %20 = load i32*, i32** %data2, align 8, !dbg !87
  call void @printWLine(i32* %20), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* null) #7, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #7, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !116, metadata !DIExpression()), !dbg !117
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !118, metadata !DIExpression()), !dbg !119
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = alloca i8, i64 40, align 16, !dbg !122
  %1 = bitcast i8* %0 to i32*, !dbg !123
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %2 = alloca i8, i64 44, align 16, !dbg !126
  %3 = bitcast i8* %2 to i32*, !dbg !127
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !128, metadata !DIExpression()), !dbg !130
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !131
  %5 = load i32*, i32** %4, align 8, !dbg !132
  store i32* %5, i32** %data1, align 8, !dbg !130
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !133
  store i32* %6, i32** %data1, align 8, !dbg !134
  %7 = load i32*, i32** %data1, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  %8 = load i32*, i32** %data1, align 8, !dbg !137
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !138
  store i32* %8, i32** %9, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !140, metadata !DIExpression()), !dbg !142
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !143
  %11 = load i32*, i32** %10, align 8, !dbg !144
  store i32* %11, i32** %data2, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !145, metadata !DIExpression()), !dbg !147
  %12 = bitcast [11 x i32]* %source to i8*, !dbg !147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %12, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %i, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !152
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !153
  store i64 %call, i64* %sourceLen, align 8, !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i64, i64* %i, align 8, !dbg !158
  %14 = load i64, i64* %sourceLen, align 8, !dbg !160
  %add = add i64 %14, 1, !dbg !161
  %cmp = icmp ult i64 %13, %add, !dbg !162
  br i1 %cmp, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %15 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %15, !dbg !166
  %16 = load i32, i32* %arrayidx3, align 4, !dbg !166
  %17 = load i32*, i32** %data2, align 8, !dbg !167
  %18 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx4 = getelementptr inbounds i32, i32* %17, i64 %18, !dbg !167
  store i32 %16, i32* %arrayidx4, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %19, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %20 = load i32*, i32** %data2, align 8, !dbg !175
  call void @printWLine(i32* %20), !dbg !176
  ret void, !dbg !177
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 31, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 31, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 32, type: !22)
!25 = !DILocation(line: 32, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 33, type: !4)
!27 = !DILocation(line: 33, column: 15, scope: !15)
!28 = !DILocation(line: 33, column: 42, scope: !15)
!29 = !DILocation(line: 33, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 34, type: !4)
!31 = !DILocation(line: 34, column: 15, scope: !15)
!32 = !DILocation(line: 34, column: 43, scope: !15)
!33 = !DILocation(line: 34, column: 32, scope: !15)
!34 = !DILocalVariable(name: "data", scope: !35, file: !16, line: 36, type: !4)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!36 = !DILocation(line: 36, column: 19, scope: !35)
!37 = !DILocation(line: 36, column: 27, scope: !35)
!38 = !DILocation(line: 36, column: 26, scope: !35)
!39 = !DILocation(line: 39, column: 16, scope: !35)
!40 = !DILocation(line: 39, column: 14, scope: !35)
!41 = !DILocation(line: 40, column: 9, scope: !35)
!42 = !DILocation(line: 40, column: 17, scope: !35)
!43 = !DILocation(line: 41, column: 21, scope: !35)
!44 = !DILocation(line: 41, column: 10, scope: !35)
!45 = !DILocation(line: 41, column: 19, scope: !35)
!46 = !DILocalVariable(name: "data", scope: !47, file: !16, line: 44, type: !4)
!47 = distinct !DILexicalBlock(scope: !15, file: !16, line: 43, column: 5)
!48 = !DILocation(line: 44, column: 19, scope: !47)
!49 = !DILocation(line: 44, column: 27, scope: !47)
!50 = !DILocation(line: 44, column: 26, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !52, file: !16, line: 46, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !16, line: 45, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 11)
!56 = !DILocation(line: 46, column: 21, scope: !52)
!57 = !DILocalVariable(name: "i", scope: !52, file: !16, line: 47, type: !58)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !59)
!59 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 47, column: 20, scope: !52)
!61 = !DILocalVariable(name: "sourceLen", scope: !52, file: !16, line: 47, type: !58)
!62 = !DILocation(line: 47, column: 23, scope: !52)
!63 = !DILocation(line: 48, column: 32, scope: !52)
!64 = !DILocation(line: 48, column: 25, scope: !52)
!65 = !DILocation(line: 48, column: 23, scope: !52)
!66 = !DILocation(line: 51, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !52, file: !16, line: 51, column: 13)
!68 = !DILocation(line: 51, column: 18, scope: !67)
!69 = !DILocation(line: 51, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !16, line: 51, column: 13)
!71 = !DILocation(line: 51, column: 29, scope: !70)
!72 = !DILocation(line: 51, column: 39, scope: !70)
!73 = !DILocation(line: 51, column: 27, scope: !70)
!74 = !DILocation(line: 51, column: 13, scope: !67)
!75 = !DILocation(line: 53, column: 34, scope: !76)
!76 = distinct !DILexicalBlock(scope: !70, file: !16, line: 52, column: 13)
!77 = !DILocation(line: 53, column: 27, scope: !76)
!78 = !DILocation(line: 53, column: 17, scope: !76)
!79 = !DILocation(line: 53, column: 22, scope: !76)
!80 = !DILocation(line: 53, column: 25, scope: !76)
!81 = !DILocation(line: 54, column: 13, scope: !76)
!82 = !DILocation(line: 51, column: 45, scope: !70)
!83 = !DILocation(line: 51, column: 13, scope: !70)
!84 = distinct !{!84, !74, !85, !86}
!85 = !DILocation(line: 54, column: 13, scope: !67)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 55, column: 24, scope: !52)
!88 = !DILocation(line: 55, column: 13, scope: !52)
!89 = !DILocation(line: 58, column: 1, scope: !15)
!90 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_32_good", scope: !16, file: !16, line: 97, type: !17, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 99, column: 5, scope: !90)
!92 = !DILocation(line: 100, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 111, type: !94, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!7, !7, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !16, line: 111, type: !7)
!100 = !DILocation(line: 111, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !16, line: 111, type: !96)
!102 = !DILocation(line: 111, column: 27, scope: !93)
!103 = !DILocation(line: 114, column: 22, scope: !93)
!104 = !DILocation(line: 114, column: 12, scope: !93)
!105 = !DILocation(line: 114, column: 5, scope: !93)
!106 = !DILocation(line: 116, column: 5, scope: !93)
!107 = !DILocation(line: 117, column: 5, scope: !93)
!108 = !DILocation(line: 118, column: 5, scope: !93)
!109 = !DILocation(line: 121, column: 5, scope: !93)
!110 = !DILocation(line: 122, column: 5, scope: !93)
!111 = !DILocation(line: 123, column: 5, scope: !93)
!112 = !DILocation(line: 125, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !16, line: 67, type: !4)
!115 = !DILocation(line: 67, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataPtr1", scope: !113, file: !16, line: 68, type: !22)
!117 = !DILocation(line: 68, column: 16, scope: !113)
!118 = !DILocalVariable(name: "dataPtr2", scope: !113, file: !16, line: 69, type: !22)
!119 = !DILocation(line: 69, column: 16, scope: !113)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !16, line: 70, type: !4)
!121 = !DILocation(line: 70, column: 15, scope: !113)
!122 = !DILocation(line: 70, column: 42, scope: !113)
!123 = !DILocation(line: 70, column: 31, scope: !113)
!124 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !16, line: 71, type: !4)
!125 = !DILocation(line: 71, column: 15, scope: !113)
!126 = !DILocation(line: 71, column: 43, scope: !113)
!127 = !DILocation(line: 71, column: 32, scope: !113)
!128 = !DILocalVariable(name: "data", scope: !129, file: !16, line: 73, type: !4)
!129 = distinct !DILexicalBlock(scope: !113, file: !16, line: 72, column: 5)
!130 = !DILocation(line: 73, column: 19, scope: !129)
!131 = !DILocation(line: 73, column: 27, scope: !129)
!132 = !DILocation(line: 73, column: 26, scope: !129)
!133 = !DILocation(line: 76, column: 16, scope: !129)
!134 = !DILocation(line: 76, column: 14, scope: !129)
!135 = !DILocation(line: 77, column: 9, scope: !129)
!136 = !DILocation(line: 77, column: 17, scope: !129)
!137 = !DILocation(line: 78, column: 21, scope: !129)
!138 = !DILocation(line: 78, column: 10, scope: !129)
!139 = !DILocation(line: 78, column: 19, scope: !129)
!140 = !DILocalVariable(name: "data", scope: !141, file: !16, line: 81, type: !4)
!141 = distinct !DILexicalBlock(scope: !113, file: !16, line: 80, column: 5)
!142 = !DILocation(line: 81, column: 19, scope: !141)
!143 = !DILocation(line: 81, column: 27, scope: !141)
!144 = !DILocation(line: 81, column: 26, scope: !141)
!145 = !DILocalVariable(name: "source", scope: !146, file: !16, line: 83, type: !53)
!146 = distinct !DILexicalBlock(scope: !141, file: !16, line: 82, column: 9)
!147 = !DILocation(line: 83, column: 21, scope: !146)
!148 = !DILocalVariable(name: "i", scope: !146, file: !16, line: 84, type: !58)
!149 = !DILocation(line: 84, column: 20, scope: !146)
!150 = !DILocalVariable(name: "sourceLen", scope: !146, file: !16, line: 84, type: !58)
!151 = !DILocation(line: 84, column: 23, scope: !146)
!152 = !DILocation(line: 85, column: 32, scope: !146)
!153 = !DILocation(line: 85, column: 25, scope: !146)
!154 = !DILocation(line: 85, column: 23, scope: !146)
!155 = !DILocation(line: 88, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !146, file: !16, line: 88, column: 13)
!157 = !DILocation(line: 88, column: 18, scope: !156)
!158 = !DILocation(line: 88, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !16, line: 88, column: 13)
!160 = !DILocation(line: 88, column: 29, scope: !159)
!161 = !DILocation(line: 88, column: 39, scope: !159)
!162 = !DILocation(line: 88, column: 27, scope: !159)
!163 = !DILocation(line: 88, column: 13, scope: !156)
!164 = !DILocation(line: 90, column: 34, scope: !165)
!165 = distinct !DILexicalBlock(scope: !159, file: !16, line: 89, column: 13)
!166 = !DILocation(line: 90, column: 27, scope: !165)
!167 = !DILocation(line: 90, column: 17, scope: !165)
!168 = !DILocation(line: 90, column: 22, scope: !165)
!169 = !DILocation(line: 90, column: 25, scope: !165)
!170 = !DILocation(line: 91, column: 13, scope: !165)
!171 = !DILocation(line: 88, column: 45, scope: !159)
!172 = !DILocation(line: 88, column: 13, scope: !159)
!173 = distinct !{!173, !163, !174, !86}
!174 = !DILocation(line: 91, column: 13, scope: !156)
!175 = !DILocation(line: 92, column: 24, scope: !146)
!176 = !DILocation(line: 92, column: 13, scope: !146)
!177 = !DILocation(line: 95, column: 1, scope: !113)
