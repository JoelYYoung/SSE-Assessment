; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i1 = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 40, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 44, align 16, !dbg !29
  %3 = bitcast i8* %2 to i32*, !dbg !30
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !34
  %cmp = icmp slt i32 %4, 1, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  store i32* %5, i32** %data, align 8, !dbg !40
  %6 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %7, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17_bad.source to i8*), i64 44, i1 false), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !55, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !59, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !61
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !62
  store i64 %call, i64* %sourceLen, align 8, !dbg !63
  store i64 0, i64* %i1, align 8, !dbg !64
  br label %for.cond2, !dbg !66

for.cond2:                                        ; preds = %for.inc7, %for.end
  %9 = load i64, i64* %i1, align 8, !dbg !67
  %10 = load i64, i64* %sourceLen, align 8, !dbg !69
  %add = add i64 %10, 1, !dbg !70
  %cmp3 = icmp ult i64 %9, %add, !dbg !71
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !72

for.body4:                                        ; preds = %for.cond2
  %11 = load i64, i64* %i1, align 8, !dbg !73
  %arrayidx5 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %11, !dbg !75
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !75
  %13 = load i32*, i32** %data, align 8, !dbg !76
  %14 = load i64, i64* %i1, align 8, !dbg !77
  %arrayidx6 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !76
  store i32 %12, i32* %arrayidx6, align 4, !dbg !78
  br label %for.inc7, !dbg !79

for.inc7:                                         ; preds = %for.body4
  %15 = load i64, i64* %i1, align 8, !dbg !80
  %inc8 = add i64 %15, 1, !dbg !80
  store i64 %inc8, i64* %i1, align 8, !dbg !80
  br label %for.cond2, !dbg !81, !llvm.loop !82

for.end9:                                         ; preds = %for.cond2
  %16 = load i32*, i32** %data, align 8, !dbg !84
  call void @printWLine(i32* %16), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #7, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #7, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = alloca i8, i64 40, align 16, !dbg !117
  %1 = bitcast i8* %0 to i32*, !dbg !118
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %2 = alloca i8, i64 44, align 16, !dbg !121
  %3 = bitcast i8* %2 to i32*, !dbg !122
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !120
  store i32 0, i32* %h, align 4, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !126
  %cmp = icmp slt i32 %4, 1, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !130
  store i32* %5, i32** %data, align 8, !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %h, align 4, !dbg !136
  %inc = add nsw i32 %7, 1, !dbg !136
  store i32 %inc, i32* %h, align 4, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !142
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !147
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !148
  store i64 %call, i64* %sourceLen, align 8, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond1, !dbg !152

for.cond1:                                        ; preds = %for.inc6, %for.end
  %9 = load i64, i64* %i, align 8, !dbg !153
  %10 = load i64, i64* %sourceLen, align 8, !dbg !155
  %add = add i64 %10, 1, !dbg !156
  %cmp2 = icmp ult i64 %9, %add, !dbg !157
  br i1 %cmp2, label %for.body3, label %for.end8, !dbg !158

for.body3:                                        ; preds = %for.cond1
  %11 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %11, !dbg !161
  %12 = load i32, i32* %arrayidx4, align 4, !dbg !161
  %13 = load i32*, i32** %data, align 8, !dbg !162
  %14 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !162
  store i32 %12, i32* %arrayidx5, align 4, !dbg !164
  br label %for.inc6, !dbg !165

for.inc6:                                         ; preds = %for.body3
  %15 = load i64, i64* %i, align 8, !dbg !166
  %inc7 = add i64 %15, 1, !dbg !166
  store i64 %inc7, i64* %i, align 8, !dbg !166
  br label %for.cond1, !dbg !167, !llvm.loop !168

for.end8:                                         ; preds = %for.cond1
  %16 = load i32*, i32** %data, align 8, !dbg !170
  call void @printWLine(i32* %16), !dbg !171
  ret void, !dbg !172
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 30, type: !7)
!20 = !DILocation(line: 30, column: 9, scope: !15)
!21 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 32, type: !4)
!24 = !DILocation(line: 32, column: 15, scope: !15)
!25 = !DILocation(line: 32, column: 42, scope: !15)
!26 = !DILocation(line: 32, column: 31, scope: !15)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 33, type: !4)
!28 = !DILocation(line: 33, column: 15, scope: !15)
!29 = !DILocation(line: 33, column: 43, scope: !15)
!30 = !DILocation(line: 33, column: 32, scope: !15)
!31 = !DILocation(line: 34, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!33 = !DILocation(line: 34, column: 9, scope: !32)
!34 = !DILocation(line: 34, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !16, line: 34, column: 5)
!36 = !DILocation(line: 34, column: 18, scope: !35)
!37 = !DILocation(line: 34, column: 5, scope: !32)
!38 = !DILocation(line: 38, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !16, line: 35, column: 5)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 39, column: 9, scope: !39)
!42 = !DILocation(line: 39, column: 17, scope: !39)
!43 = !DILocation(line: 40, column: 5, scope: !39)
!44 = !DILocation(line: 34, column: 24, scope: !35)
!45 = !DILocation(line: 34, column: 5, scope: !35)
!46 = distinct !{!46, !37, !47, !48}
!47 = !DILocation(line: 40, column: 5, scope: !32)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocalVariable(name: "source", scope: !50, file: !16, line: 42, type: !51)
!50 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 11)
!54 = !DILocation(line: 42, column: 17, scope: !50)
!55 = !DILocalVariable(name: "i", scope: !50, file: !16, line: 43, type: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !57)
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 43, column: 16, scope: !50)
!59 = !DILocalVariable(name: "sourceLen", scope: !50, file: !16, line: 43, type: !56)
!60 = !DILocation(line: 43, column: 19, scope: !50)
!61 = !DILocation(line: 44, column: 28, scope: !50)
!62 = !DILocation(line: 44, column: 21, scope: !50)
!63 = !DILocation(line: 44, column: 19, scope: !50)
!64 = !DILocation(line: 47, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !50, file: !16, line: 47, column: 9)
!66 = !DILocation(line: 47, column: 14, scope: !65)
!67 = !DILocation(line: 47, column: 21, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !16, line: 47, column: 9)
!69 = !DILocation(line: 47, column: 25, scope: !68)
!70 = !DILocation(line: 47, column: 35, scope: !68)
!71 = !DILocation(line: 47, column: 23, scope: !68)
!72 = !DILocation(line: 47, column: 9, scope: !65)
!73 = !DILocation(line: 49, column: 30, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !16, line: 48, column: 9)
!75 = !DILocation(line: 49, column: 23, scope: !74)
!76 = !DILocation(line: 49, column: 13, scope: !74)
!77 = !DILocation(line: 49, column: 18, scope: !74)
!78 = !DILocation(line: 49, column: 21, scope: !74)
!79 = !DILocation(line: 50, column: 9, scope: !74)
!80 = !DILocation(line: 47, column: 41, scope: !68)
!81 = !DILocation(line: 47, column: 9, scope: !68)
!82 = distinct !{!82, !72, !83, !48}
!83 = !DILocation(line: 50, column: 9, scope: !65)
!84 = !DILocation(line: 51, column: 20, scope: !50)
!85 = !DILocation(line: 51, column: 9, scope: !50)
!86 = !DILocation(line: 53, column: 1, scope: !15)
!87 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_17_good", scope: !16, file: !16, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 89, column: 5, scope: !87)
!89 = !DILocation(line: 90, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 102, type: !91, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!7, !7, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !16, line: 102, type: !7)
!97 = !DILocation(line: 102, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !16, line: 102, type: !93)
!99 = !DILocation(line: 102, column: 27, scope: !90)
!100 = !DILocation(line: 105, column: 22, scope: !90)
!101 = !DILocation(line: 105, column: 12, scope: !90)
!102 = !DILocation(line: 105, column: 5, scope: !90)
!103 = !DILocation(line: 107, column: 5, scope: !90)
!104 = !DILocation(line: 108, column: 5, scope: !90)
!105 = !DILocation(line: 109, column: 5, scope: !90)
!106 = !DILocation(line: 112, column: 5, scope: !90)
!107 = !DILocation(line: 113, column: 5, scope: !90)
!108 = !DILocation(line: 114, column: 5, scope: !90)
!109 = !DILocation(line: 116, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "h", scope: !110, file: !16, line: 62, type: !7)
!112 = !DILocation(line: 62, column: 9, scope: !110)
!113 = !DILocalVariable(name: "data", scope: !110, file: !16, line: 63, type: !4)
!114 = !DILocation(line: 63, column: 15, scope: !110)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !16, line: 64, type: !4)
!116 = !DILocation(line: 64, column: 15, scope: !110)
!117 = !DILocation(line: 64, column: 42, scope: !110)
!118 = !DILocation(line: 64, column: 31, scope: !110)
!119 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !16, line: 65, type: !4)
!120 = !DILocation(line: 65, column: 15, scope: !110)
!121 = !DILocation(line: 65, column: 43, scope: !110)
!122 = !DILocation(line: 65, column: 32, scope: !110)
!123 = !DILocation(line: 66, column: 11, scope: !124)
!124 = distinct !DILexicalBlock(scope: !110, file: !16, line: 66, column: 5)
!125 = !DILocation(line: 66, column: 9, scope: !124)
!126 = !DILocation(line: 66, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !16, line: 66, column: 5)
!128 = !DILocation(line: 66, column: 18, scope: !127)
!129 = !DILocation(line: 66, column: 5, scope: !124)
!130 = !DILocation(line: 70, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !16, line: 67, column: 5)
!132 = !DILocation(line: 70, column: 14, scope: !131)
!133 = !DILocation(line: 71, column: 9, scope: !131)
!134 = !DILocation(line: 71, column: 17, scope: !131)
!135 = !DILocation(line: 72, column: 5, scope: !131)
!136 = !DILocation(line: 66, column: 24, scope: !127)
!137 = !DILocation(line: 66, column: 5, scope: !127)
!138 = distinct !{!138, !129, !139, !48}
!139 = !DILocation(line: 72, column: 5, scope: !124)
!140 = !DILocalVariable(name: "source", scope: !141, file: !16, line: 74, type: !51)
!141 = distinct !DILexicalBlock(scope: !110, file: !16, line: 73, column: 5)
!142 = !DILocation(line: 74, column: 17, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !141, file: !16, line: 75, type: !56)
!144 = !DILocation(line: 75, column: 16, scope: !141)
!145 = !DILocalVariable(name: "sourceLen", scope: !141, file: !16, line: 75, type: !56)
!146 = !DILocation(line: 75, column: 19, scope: !141)
!147 = !DILocation(line: 76, column: 28, scope: !141)
!148 = !DILocation(line: 76, column: 21, scope: !141)
!149 = !DILocation(line: 76, column: 19, scope: !141)
!150 = !DILocation(line: 79, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !141, file: !16, line: 79, column: 9)
!152 = !DILocation(line: 79, column: 14, scope: !151)
!153 = !DILocation(line: 79, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !16, line: 79, column: 9)
!155 = !DILocation(line: 79, column: 25, scope: !154)
!156 = !DILocation(line: 79, column: 35, scope: !154)
!157 = !DILocation(line: 79, column: 23, scope: !154)
!158 = !DILocation(line: 79, column: 9, scope: !151)
!159 = !DILocation(line: 81, column: 30, scope: !160)
!160 = distinct !DILexicalBlock(scope: !154, file: !16, line: 80, column: 9)
!161 = !DILocation(line: 81, column: 23, scope: !160)
!162 = !DILocation(line: 81, column: 13, scope: !160)
!163 = !DILocation(line: 81, column: 18, scope: !160)
!164 = !DILocation(line: 81, column: 21, scope: !160)
!165 = !DILocation(line: 82, column: 9, scope: !160)
!166 = !DILocation(line: 79, column: 41, scope: !154)
!167 = !DILocation(line: 79, column: 9, scope: !154)
!168 = distinct !{!168, !158, !169, !48}
!169 = !DILocation(line: 82, column: 9, scope: !151)
!170 = !DILocation(line: 83, column: 20, scope: !141)
!171 = !DILocation(line: 83, column: 9, scope: !141)
!172 = !DILocation(line: 85, column: 1, scope: !110)
