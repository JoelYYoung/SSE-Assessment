; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15_bad.source to i8*), i64 44, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !46
  store i64 %call, i64* %sourceLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !51
  %8 = load i64, i64* %sourceLen, align 8, !dbg !53
  %add = add i64 %8, 1, !dbg !54
  %cmp = icmp ult i64 %7, %add, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !59
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !59
  %11 = load i32*, i32** %data, align 8, !dbg !60
  %12 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !60
  store i32 %10, i32* %arrayidx2, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %13, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !69
  call void @printWLine(i32* %14), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #7, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #7, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 40, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %2 = alloca i8, i64 44, align 16, !dbg !105
  %3 = bitcast i8* %2 to i32*, !dbg !106
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !104
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !107
  store i32* %4, i32** %data, align 8, !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !118
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !119
  store i64 %call, i64* %sourceLen, align 8, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !124
  %8 = load i64, i64* %sourceLen, align 8, !dbg !126
  %add = add i64 %8, 1, !dbg !127
  %cmp = icmp ult i64 %7, %add, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !132
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !132
  %11 = load i32*, i32** %data, align 8, !dbg !133
  %12 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !133
  store i32 %10, i32* %arrayidx2, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %13, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !141
  call void @printWLine(i32* %14), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = alloca i8, i64 40, align 16, !dbg !149
  %1 = bitcast i8* %0 to i32*, !dbg !150
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  %2 = alloca i8, i64 44, align 16, !dbg !153
  %3 = bitcast i8* %2 to i32*, !dbg !154
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !152
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !155
  store i32* %4, i32** %data, align 8, !dbg !156
  %5 = load i32*, i32** %data, align 8, !dbg !157
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !157
  store i32 0, i32* %arrayidx, align 4, !dbg !158
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !159, metadata !DIExpression()), !dbg !161
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !161
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !164, metadata !DIExpression()), !dbg !165
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !166
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !167
  store i64 %call, i64* %sourceLen, align 8, !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !172
  %8 = load i64, i64* %sourceLen, align 8, !dbg !174
  %add = add i64 %8, 1, !dbg !175
  %cmp = icmp ult i64 %7, %add, !dbg !176
  br i1 %cmp, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !180
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !180
  %11 = load i32*, i32** %data, align 8, !dbg !181
  %12 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !181
  store i32 %10, i32* %arrayidx2, align 4, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %13, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !189
  call void @printWLine(i32* %14), !dbg !190
  ret void, !dbg !191
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 38, column: 16, scope: !15)
!30 = !DILocation(line: 38, column: 14, scope: !15)
!31 = !DILocation(line: 39, column: 9, scope: !15)
!32 = !DILocation(line: 39, column: 17, scope: !15)
!33 = !DILocalVariable(name: "source", scope: !34, file: !16, line: 47, type: !35)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 46, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 47, column: 17, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !16, line: 48, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 48, column: 16, scope: !34)
!43 = !DILocalVariable(name: "sourceLen", scope: !34, file: !16, line: 48, type: !40)
!44 = !DILocation(line: 48, column: 19, scope: !34)
!45 = !DILocation(line: 49, column: 28, scope: !34)
!46 = !DILocation(line: 49, column: 21, scope: !34)
!47 = !DILocation(line: 49, column: 19, scope: !34)
!48 = !DILocation(line: 52, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !34, file: !16, line: 52, column: 9)
!50 = !DILocation(line: 52, column: 14, scope: !49)
!51 = !DILocation(line: 52, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !16, line: 52, column: 9)
!53 = !DILocation(line: 52, column: 25, scope: !52)
!54 = !DILocation(line: 52, column: 35, scope: !52)
!55 = !DILocation(line: 52, column: 23, scope: !52)
!56 = !DILocation(line: 52, column: 9, scope: !49)
!57 = !DILocation(line: 54, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !16, line: 53, column: 9)
!59 = !DILocation(line: 54, column: 23, scope: !58)
!60 = !DILocation(line: 54, column: 13, scope: !58)
!61 = !DILocation(line: 54, column: 18, scope: !58)
!62 = !DILocation(line: 54, column: 21, scope: !58)
!63 = !DILocation(line: 55, column: 9, scope: !58)
!64 = !DILocation(line: 52, column: 41, scope: !52)
!65 = !DILocation(line: 52, column: 9, scope: !52)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 55, column: 9, scope: !49)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 56, column: 20, scope: !34)
!70 = !DILocation(line: 56, column: 9, scope: !34)
!71 = !DILocation(line: 58, column: 1, scope: !15)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_15_good", scope: !16, file: !16, line: 130, type: !17, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 132, column: 5, scope: !72)
!74 = !DILocation(line: 133, column: 5, scope: !72)
!75 = !DILocation(line: 134, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 146, type: !77, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!7, !7, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !16, line: 146, type: !7)
!83 = !DILocation(line: 146, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !16, line: 146, type: !79)
!85 = !DILocation(line: 146, column: 27, scope: !76)
!86 = !DILocation(line: 149, column: 22, scope: !76)
!87 = !DILocation(line: 149, column: 12, scope: !76)
!88 = !DILocation(line: 149, column: 5, scope: !76)
!89 = !DILocation(line: 151, column: 5, scope: !76)
!90 = !DILocation(line: 152, column: 5, scope: !76)
!91 = !DILocation(line: 153, column: 5, scope: !76)
!92 = !DILocation(line: 156, column: 5, scope: !76)
!93 = !DILocation(line: 157, column: 5, scope: !76)
!94 = !DILocation(line: 158, column: 5, scope: !76)
!95 = !DILocation(line: 160, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !16, line: 67, type: !4)
!98 = !DILocation(line: 67, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !16, line: 68, type: !4)
!100 = !DILocation(line: 68, column: 15, scope: !96)
!101 = !DILocation(line: 68, column: 42, scope: !96)
!102 = !DILocation(line: 68, column: 31, scope: !96)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !16, line: 69, type: !4)
!104 = !DILocation(line: 69, column: 15, scope: !96)
!105 = !DILocation(line: 69, column: 43, scope: !96)
!106 = !DILocation(line: 69, column: 32, scope: !96)
!107 = !DILocation(line: 79, column: 16, scope: !96)
!108 = !DILocation(line: 79, column: 14, scope: !96)
!109 = !DILocation(line: 80, column: 9, scope: !96)
!110 = !DILocation(line: 80, column: 17, scope: !96)
!111 = !DILocalVariable(name: "source", scope: !112, file: !16, line: 84, type: !35)
!112 = distinct !DILexicalBlock(scope: !96, file: !16, line: 83, column: 5)
!113 = !DILocation(line: 84, column: 17, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !112, file: !16, line: 85, type: !40)
!115 = !DILocation(line: 85, column: 16, scope: !112)
!116 = !DILocalVariable(name: "sourceLen", scope: !112, file: !16, line: 85, type: !40)
!117 = !DILocation(line: 85, column: 19, scope: !112)
!118 = !DILocation(line: 86, column: 28, scope: !112)
!119 = !DILocation(line: 86, column: 21, scope: !112)
!120 = !DILocation(line: 86, column: 19, scope: !112)
!121 = !DILocation(line: 89, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !112, file: !16, line: 89, column: 9)
!123 = !DILocation(line: 89, column: 14, scope: !122)
!124 = !DILocation(line: 89, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !16, line: 89, column: 9)
!126 = !DILocation(line: 89, column: 25, scope: !125)
!127 = !DILocation(line: 89, column: 35, scope: !125)
!128 = !DILocation(line: 89, column: 23, scope: !125)
!129 = !DILocation(line: 89, column: 9, scope: !122)
!130 = !DILocation(line: 91, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !16, line: 90, column: 9)
!132 = !DILocation(line: 91, column: 23, scope: !131)
!133 = !DILocation(line: 91, column: 13, scope: !131)
!134 = !DILocation(line: 91, column: 18, scope: !131)
!135 = !DILocation(line: 91, column: 21, scope: !131)
!136 = !DILocation(line: 92, column: 9, scope: !131)
!137 = !DILocation(line: 89, column: 41, scope: !125)
!138 = !DILocation(line: 89, column: 9, scope: !125)
!139 = distinct !{!139, !129, !140, !68}
!140 = !DILocation(line: 92, column: 9, scope: !122)
!141 = !DILocation(line: 93, column: 20, scope: !112)
!142 = !DILocation(line: 93, column: 9, scope: !112)
!143 = !DILocation(line: 95, column: 1, scope: !96)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 98, type: !17, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!145 = !DILocalVariable(name: "data", scope: !144, file: !16, line: 100, type: !4)
!146 = !DILocation(line: 100, column: 15, scope: !144)
!147 = !DILocalVariable(name: "dataBadBuffer", scope: !144, file: !16, line: 101, type: !4)
!148 = !DILocation(line: 101, column: 15, scope: !144)
!149 = !DILocation(line: 101, column: 42, scope: !144)
!150 = !DILocation(line: 101, column: 31, scope: !144)
!151 = !DILocalVariable(name: "dataGoodBuffer", scope: !144, file: !16, line: 102, type: !4)
!152 = !DILocation(line: 102, column: 15, scope: !144)
!153 = !DILocation(line: 102, column: 43, scope: !144)
!154 = !DILocation(line: 102, column: 32, scope: !144)
!155 = !DILocation(line: 108, column: 16, scope: !144)
!156 = !DILocation(line: 108, column: 14, scope: !144)
!157 = !DILocation(line: 109, column: 9, scope: !144)
!158 = !DILocation(line: 109, column: 17, scope: !144)
!159 = !DILocalVariable(name: "source", scope: !160, file: !16, line: 117, type: !35)
!160 = distinct !DILexicalBlock(scope: !144, file: !16, line: 116, column: 5)
!161 = !DILocation(line: 117, column: 17, scope: !160)
!162 = !DILocalVariable(name: "i", scope: !160, file: !16, line: 118, type: !40)
!163 = !DILocation(line: 118, column: 16, scope: !160)
!164 = !DILocalVariable(name: "sourceLen", scope: !160, file: !16, line: 118, type: !40)
!165 = !DILocation(line: 118, column: 19, scope: !160)
!166 = !DILocation(line: 119, column: 28, scope: !160)
!167 = !DILocation(line: 119, column: 21, scope: !160)
!168 = !DILocation(line: 119, column: 19, scope: !160)
!169 = !DILocation(line: 122, column: 16, scope: !170)
!170 = distinct !DILexicalBlock(scope: !160, file: !16, line: 122, column: 9)
!171 = !DILocation(line: 122, column: 14, scope: !170)
!172 = !DILocation(line: 122, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !16, line: 122, column: 9)
!174 = !DILocation(line: 122, column: 25, scope: !173)
!175 = !DILocation(line: 122, column: 35, scope: !173)
!176 = !DILocation(line: 122, column: 23, scope: !173)
!177 = !DILocation(line: 122, column: 9, scope: !170)
!178 = !DILocation(line: 124, column: 30, scope: !179)
!179 = distinct !DILexicalBlock(scope: !173, file: !16, line: 123, column: 9)
!180 = !DILocation(line: 124, column: 23, scope: !179)
!181 = !DILocation(line: 124, column: 13, scope: !179)
!182 = !DILocation(line: 124, column: 18, scope: !179)
!183 = !DILocation(line: 124, column: 21, scope: !179)
!184 = !DILocation(line: 125, column: 9, scope: !179)
!185 = !DILocation(line: 122, column: 41, scope: !173)
!186 = !DILocation(line: 122, column: 9, scope: !173)
!187 = distinct !{!187, !177, !188, !68}
!188 = !DILocation(line: 125, column: 9, scope: !170)
!189 = !DILocation(line: 126, column: 20, scope: !160)
!190 = !DILocation(line: 126, column: 9, scope: !160)
!191 = !DILocation(line: 128, column: 1, scope: !144)
