; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_bad.source to i8*), i64 44, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !45
  store i64 %call, i64* %sourceLen, align 8, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !50
  %3 = load i64, i64* %sourceLen, align 8, !dbg !52
  %add = add i64 %3, 1, !dbg !53
  %cmp = icmp ult i64 %2, %add, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !58
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !58
  %6 = load i32*, i32** %data, align 8, !dbg !59
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !59
  store i32 %5, i32* %arrayidx3, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %8, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %9), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #7, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #7, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  store i32* %arraydecay, i32** %data, align 8, !dbg !103
  %0 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !113
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !114
  store i64 %call, i64* %sourceLen, align 8, !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !119
  %3 = load i64, i64* %sourceLen, align 8, !dbg !121
  %add = add i64 %3, 1, !dbg !122
  %cmp = icmp ult i64 %2, %add, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !127
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !127
  %6 = load i32*, i32** %data, align 8, !dbg !128
  %7 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !128
  store i32 %5, i32* %arrayidx3, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %8, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !136
  call void @printWLine(i32* %9), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !146
  store i32* %arraydecay, i32** %data, align 8, !dbg !147
  %0 = load i32*, i32** %data, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !150, metadata !DIExpression()), !dbg !152
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !152
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !152
  call void @llvm.dbg.declare(metadata i64* %i, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !155, metadata !DIExpression()), !dbg !156
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !157
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !158
  store i64 %call, i64* %sourceLen, align 8, !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !163
  %3 = load i64, i64* %sourceLen, align 8, !dbg !165
  %add = add i64 %3, 1, !dbg !166
  %cmp = icmp ult i64 %2, %add, !dbg !167
  br i1 %cmp, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !171
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !171
  %6 = load i32*, i32** %data, align 8, !dbg !172
  %7 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !172
  store i32 %5, i32* %arrayidx3, align 4, !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !176
  %inc = add i64 %8, 1, !dbg !176
  store i64 %inc, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !180
  call void @printWLine(i32* %9), !dbg !181
  ret void, !dbg !182
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 38, column: 16, scope: !11)
!32 = !DILocation(line: 38, column: 14, scope: !11)
!33 = !DILocation(line: 39, column: 9, scope: !11)
!34 = !DILocation(line: 39, column: 17, scope: !11)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 47, type: !27)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!37 = !DILocation(line: 47, column: 17, scope: !36)
!38 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 48, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 48, column: 16, scope: !36)
!42 = !DILocalVariable(name: "sourceLen", scope: !36, file: !12, line: 48, type: !39)
!43 = !DILocation(line: 48, column: 19, scope: !36)
!44 = !DILocation(line: 49, column: 28, scope: !36)
!45 = !DILocation(line: 49, column: 21, scope: !36)
!46 = !DILocation(line: 49, column: 19, scope: !36)
!47 = !DILocation(line: 52, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !36, file: !12, line: 52, column: 9)
!49 = !DILocation(line: 52, column: 14, scope: !48)
!50 = !DILocation(line: 52, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 52, column: 9)
!52 = !DILocation(line: 52, column: 25, scope: !51)
!53 = !DILocation(line: 52, column: 35, scope: !51)
!54 = !DILocation(line: 52, column: 23, scope: !51)
!55 = !DILocation(line: 52, column: 9, scope: !48)
!56 = !DILocation(line: 54, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !12, line: 53, column: 9)
!58 = !DILocation(line: 54, column: 23, scope: !57)
!59 = !DILocation(line: 54, column: 13, scope: !57)
!60 = !DILocation(line: 54, column: 18, scope: !57)
!61 = !DILocation(line: 54, column: 21, scope: !57)
!62 = !DILocation(line: 55, column: 9, scope: !57)
!63 = !DILocation(line: 52, column: 41, scope: !51)
!64 = !DILocation(line: 52, column: 9, scope: !51)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 55, column: 9, scope: !48)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 56, column: 20, scope: !36)
!69 = !DILocation(line: 56, column: 9, scope: !36)
!70 = !DILocation(line: 58, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_good", scope: !12, file: !12, line: 130, type: !13, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 132, column: 5, scope: !71)
!73 = !DILocation(line: 133, column: 5, scope: !71)
!74 = !DILocation(line: 134, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 146, type: !76, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!19, !19, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 146, type: !19)
!82 = !DILocation(line: 146, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 146, type: !78)
!84 = !DILocation(line: 146, column: 27, scope: !75)
!85 = !DILocation(line: 149, column: 22, scope: !75)
!86 = !DILocation(line: 149, column: 12, scope: !75)
!87 = !DILocation(line: 149, column: 5, scope: !75)
!88 = !DILocation(line: 151, column: 5, scope: !75)
!89 = !DILocation(line: 152, column: 5, scope: !75)
!90 = !DILocation(line: 153, column: 5, scope: !75)
!91 = !DILocation(line: 156, column: 5, scope: !75)
!92 = !DILocation(line: 157, column: 5, scope: !75)
!93 = !DILocation(line: 158, column: 5, scope: !75)
!94 = !DILocation(line: 160, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 67, type: !16)
!97 = !DILocation(line: 67, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !12, line: 68, type: !22)
!99 = !DILocation(line: 68, column: 13, scope: !95)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !12, line: 69, type: !27)
!101 = !DILocation(line: 69, column: 13, scope: !95)
!102 = !DILocation(line: 79, column: 16, scope: !95)
!103 = !DILocation(line: 79, column: 14, scope: !95)
!104 = !DILocation(line: 80, column: 9, scope: !95)
!105 = !DILocation(line: 80, column: 17, scope: !95)
!106 = !DILocalVariable(name: "source", scope: !107, file: !12, line: 84, type: !27)
!107 = distinct !DILexicalBlock(scope: !95, file: !12, line: 83, column: 5)
!108 = !DILocation(line: 84, column: 17, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !107, file: !12, line: 85, type: !39)
!110 = !DILocation(line: 85, column: 16, scope: !107)
!111 = !DILocalVariable(name: "sourceLen", scope: !107, file: !12, line: 85, type: !39)
!112 = !DILocation(line: 85, column: 19, scope: !107)
!113 = !DILocation(line: 86, column: 28, scope: !107)
!114 = !DILocation(line: 86, column: 21, scope: !107)
!115 = !DILocation(line: 86, column: 19, scope: !107)
!116 = !DILocation(line: 89, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !12, line: 89, column: 9)
!118 = !DILocation(line: 89, column: 14, scope: !117)
!119 = !DILocation(line: 89, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 89, column: 9)
!121 = !DILocation(line: 89, column: 25, scope: !120)
!122 = !DILocation(line: 89, column: 35, scope: !120)
!123 = !DILocation(line: 89, column: 23, scope: !120)
!124 = !DILocation(line: 89, column: 9, scope: !117)
!125 = !DILocation(line: 91, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !12, line: 90, column: 9)
!127 = !DILocation(line: 91, column: 23, scope: !126)
!128 = !DILocation(line: 91, column: 13, scope: !126)
!129 = !DILocation(line: 91, column: 18, scope: !126)
!130 = !DILocation(line: 91, column: 21, scope: !126)
!131 = !DILocation(line: 92, column: 9, scope: !126)
!132 = !DILocation(line: 89, column: 41, scope: !120)
!133 = !DILocation(line: 89, column: 9, scope: !120)
!134 = distinct !{!134, !124, !135, !67}
!135 = !DILocation(line: 92, column: 9, scope: !117)
!136 = !DILocation(line: 93, column: 20, scope: !107)
!137 = !DILocation(line: 93, column: 9, scope: !107)
!138 = !DILocation(line: 95, column: 1, scope: !95)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", scope: !139, file: !12, line: 100, type: !16)
!141 = !DILocation(line: 100, column: 15, scope: !139)
!142 = !DILocalVariable(name: "dataBadBuffer", scope: !139, file: !12, line: 101, type: !22)
!143 = !DILocation(line: 101, column: 13, scope: !139)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !139, file: !12, line: 102, type: !27)
!145 = !DILocation(line: 102, column: 13, scope: !139)
!146 = !DILocation(line: 108, column: 16, scope: !139)
!147 = !DILocation(line: 108, column: 14, scope: !139)
!148 = !DILocation(line: 109, column: 9, scope: !139)
!149 = !DILocation(line: 109, column: 17, scope: !139)
!150 = !DILocalVariable(name: "source", scope: !151, file: !12, line: 117, type: !27)
!151 = distinct !DILexicalBlock(scope: !139, file: !12, line: 116, column: 5)
!152 = !DILocation(line: 117, column: 17, scope: !151)
!153 = !DILocalVariable(name: "i", scope: !151, file: !12, line: 118, type: !39)
!154 = !DILocation(line: 118, column: 16, scope: !151)
!155 = !DILocalVariable(name: "sourceLen", scope: !151, file: !12, line: 118, type: !39)
!156 = !DILocation(line: 118, column: 19, scope: !151)
!157 = !DILocation(line: 119, column: 28, scope: !151)
!158 = !DILocation(line: 119, column: 21, scope: !151)
!159 = !DILocation(line: 119, column: 19, scope: !151)
!160 = !DILocation(line: 122, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !151, file: !12, line: 122, column: 9)
!162 = !DILocation(line: 122, column: 14, scope: !161)
!163 = !DILocation(line: 122, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !12, line: 122, column: 9)
!165 = !DILocation(line: 122, column: 25, scope: !164)
!166 = !DILocation(line: 122, column: 35, scope: !164)
!167 = !DILocation(line: 122, column: 23, scope: !164)
!168 = !DILocation(line: 122, column: 9, scope: !161)
!169 = !DILocation(line: 124, column: 30, scope: !170)
!170 = distinct !DILexicalBlock(scope: !164, file: !12, line: 123, column: 9)
!171 = !DILocation(line: 124, column: 23, scope: !170)
!172 = !DILocation(line: 124, column: 13, scope: !170)
!173 = !DILocation(line: 124, column: 18, scope: !170)
!174 = !DILocation(line: 124, column: 21, scope: !170)
!175 = !DILocation(line: 125, column: 9, scope: !170)
!176 = !DILocation(line: 122, column: 41, scope: !164)
!177 = !DILocation(line: 122, column: 9, scope: !164)
!178 = distinct !{!178, !168, !179, !67}
!179 = !DILocation(line: 125, column: 9, scope: !161)
!180 = !DILocation(line: 126, column: 20, scope: !151)
!181 = !DILocation(line: 126, column: 9, scope: !151)
!182 = !DILocation(line: 128, column: 1, scope: !139)
