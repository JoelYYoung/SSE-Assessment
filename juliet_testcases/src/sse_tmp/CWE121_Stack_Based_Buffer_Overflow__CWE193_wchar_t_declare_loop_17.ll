; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i1 = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !36
  %cmp = icmp slt i32 %0, 1, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i32* %arraydecay, i32** %data, align 8, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %2, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17_bad.source to i8*), i64 44, i1 false), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !54, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !58, metadata !DIExpression()), !dbg !59
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !60
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !61
  store i64 %call, i64* %sourceLen, align 8, !dbg !62
  store i64 0, i64* %i1, align 8, !dbg !63
  br label %for.cond3, !dbg !65

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i1, align 8, !dbg !66
  %5 = load i64, i64* %sourceLen, align 8, !dbg !68
  %add = add i64 %5, 1, !dbg !69
  %cmp4 = icmp ult i64 %4, %add, !dbg !70
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !71

for.body5:                                        ; preds = %for.cond3
  %6 = load i64, i64* %i1, align 8, !dbg !72
  %arrayidx6 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !74
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !74
  %8 = load i32*, i32** %data, align 8, !dbg !75
  %9 = load i64, i64* %i1, align 8, !dbg !76
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !75
  store i32 %7, i32* %arrayidx7, align 4, !dbg !77
  br label %for.inc8, !dbg !78

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i1, align 8, !dbg !79
  %inc9 = add i64 %10, 1, !dbg !79
  store i64 %inc9, i64* %i1, align 8, !dbg !79
  br label %for.cond3, !dbg !80, !llvm.loop !81

for.end10:                                        ; preds = %for.cond3
  %11 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* %11), !dbg !84
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17_good() #0 !dbg !86 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17_bad(), !dbg !106
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
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 0, i32* %h, align 4, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !121
  %cmp = icmp slt i32 %0, 1, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !125
  store i32* %arraydecay, i32** %data, align 8, !dbg !127
  %1 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !131
  %inc = add nsw i32 %2, 1, !dbg !131
  store i32 %inc, i32* %h, align 4, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !135, metadata !DIExpression()), !dbg !137
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !142
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !143
  store i64 %call, i64* %sourceLen, align 8, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond2, !dbg !147

for.cond2:                                        ; preds = %for.inc7, %for.end
  %4 = load i64, i64* %i, align 8, !dbg !148
  %5 = load i64, i64* %sourceLen, align 8, !dbg !150
  %add = add i64 %5, 1, !dbg !151
  %cmp3 = icmp ult i64 %4, %add, !dbg !152
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !153

for.body4:                                        ; preds = %for.cond2
  %6 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx5 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !156
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !156
  %8 = load i32*, i32** %data, align 8, !dbg !157
  %9 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !157
  store i32 %7, i32* %arrayidx6, align 4, !dbg !159
  br label %for.inc7, !dbg !160

for.inc7:                                         ; preds = %for.body4
  %10 = load i64, i64* %i, align 8, !dbg !161
  %inc8 = add i64 %10, 1, !dbg !161
  store i64 %inc8, i64* %i, align 8, !dbg !161
  br label %for.cond2, !dbg !162, !llvm.loop !163

for.end9:                                         ; preds = %for.cond2
  %11 = load i32*, i32** %data, align 8, !dbg !165
  call void @printWLine(i32* %11), !dbg !166
  ret void, !dbg !167
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !16)
!21 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!22 = !DILocation(line: 31, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 32, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 352, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 11)
!32 = !DILocation(line: 33, column: 13, scope: !11)
!33 = !DILocation(line: 34, column: 11, scope: !34)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!35 = !DILocation(line: 34, column: 9, scope: !34)
!36 = !DILocation(line: 34, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 5)
!38 = !DILocation(line: 34, column: 18, scope: !37)
!39 = !DILocation(line: 34, column: 5, scope: !34)
!40 = !DILocation(line: 38, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 35, column: 5)
!42 = !DILocation(line: 38, column: 14, scope: !41)
!43 = !DILocation(line: 39, column: 9, scope: !41)
!44 = !DILocation(line: 39, column: 17, scope: !41)
!45 = !DILocation(line: 40, column: 5, scope: !41)
!46 = !DILocation(line: 34, column: 24, scope: !37)
!47 = !DILocation(line: 34, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 40, column: 5, scope: !34)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 42, type: !29)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 17, scope: !52)
!54 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 43, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !21, line: 46, baseType: !56)
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 43, column: 16, scope: !52)
!58 = !DILocalVariable(name: "sourceLen", scope: !52, file: !12, line: 43, type: !55)
!59 = !DILocation(line: 43, column: 19, scope: !52)
!60 = !DILocation(line: 44, column: 28, scope: !52)
!61 = !DILocation(line: 44, column: 21, scope: !52)
!62 = !DILocation(line: 44, column: 19, scope: !52)
!63 = !DILocation(line: 47, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !52, file: !12, line: 47, column: 9)
!65 = !DILocation(line: 47, column: 14, scope: !64)
!66 = !DILocation(line: 47, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !12, line: 47, column: 9)
!68 = !DILocation(line: 47, column: 25, scope: !67)
!69 = !DILocation(line: 47, column: 35, scope: !67)
!70 = !DILocation(line: 47, column: 23, scope: !67)
!71 = !DILocation(line: 47, column: 9, scope: !64)
!72 = !DILocation(line: 49, column: 30, scope: !73)
!73 = distinct !DILexicalBlock(scope: !67, file: !12, line: 48, column: 9)
!74 = !DILocation(line: 49, column: 23, scope: !73)
!75 = !DILocation(line: 49, column: 13, scope: !73)
!76 = !DILocation(line: 49, column: 18, scope: !73)
!77 = !DILocation(line: 49, column: 21, scope: !73)
!78 = !DILocation(line: 50, column: 9, scope: !73)
!79 = !DILocation(line: 47, column: 41, scope: !67)
!80 = !DILocation(line: 47, column: 9, scope: !67)
!81 = distinct !{!81, !71, !82, !50}
!82 = !DILocation(line: 50, column: 9, scope: !64)
!83 = !DILocation(line: 51, column: 20, scope: !52)
!84 = !DILocation(line: 51, column: 9, scope: !52)
!85 = !DILocation(line: 53, column: 1, scope: !11)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_17_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 89, column: 5, scope: !86)
!88 = !DILocation(line: 90, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !90, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!16, !16, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !12, line: 102, type: !16)
!96 = !DILocation(line: 102, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !12, line: 102, type: !92)
!98 = !DILocation(line: 102, column: 27, scope: !89)
!99 = !DILocation(line: 105, column: 22, scope: !89)
!100 = !DILocation(line: 105, column: 12, scope: !89)
!101 = !DILocation(line: 105, column: 5, scope: !89)
!102 = !DILocation(line: 107, column: 5, scope: !89)
!103 = !DILocation(line: 108, column: 5, scope: !89)
!104 = !DILocation(line: 109, column: 5, scope: !89)
!105 = !DILocation(line: 112, column: 5, scope: !89)
!106 = !DILocation(line: 113, column: 5, scope: !89)
!107 = !DILocation(line: 114, column: 5, scope: !89)
!108 = !DILocation(line: 116, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "h", scope: !109, file: !12, line: 62, type: !16)
!111 = !DILocation(line: 62, column: 9, scope: !109)
!112 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 63, type: !19)
!113 = !DILocation(line: 63, column: 15, scope: !109)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !12, line: 64, type: !24)
!115 = !DILocation(line: 64, column: 13, scope: !109)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !12, line: 65, type: !29)
!117 = !DILocation(line: 65, column: 13, scope: !109)
!118 = !DILocation(line: 66, column: 11, scope: !119)
!119 = distinct !DILexicalBlock(scope: !109, file: !12, line: 66, column: 5)
!120 = !DILocation(line: 66, column: 9, scope: !119)
!121 = !DILocation(line: 66, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 66, column: 5)
!123 = !DILocation(line: 66, column: 18, scope: !122)
!124 = !DILocation(line: 66, column: 5, scope: !119)
!125 = !DILocation(line: 70, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 67, column: 5)
!127 = !DILocation(line: 70, column: 14, scope: !126)
!128 = !DILocation(line: 71, column: 9, scope: !126)
!129 = !DILocation(line: 71, column: 17, scope: !126)
!130 = !DILocation(line: 72, column: 5, scope: !126)
!131 = !DILocation(line: 66, column: 24, scope: !122)
!132 = !DILocation(line: 66, column: 5, scope: !122)
!133 = distinct !{!133, !124, !134, !50}
!134 = !DILocation(line: 72, column: 5, scope: !119)
!135 = !DILocalVariable(name: "source", scope: !136, file: !12, line: 74, type: !29)
!136 = distinct !DILexicalBlock(scope: !109, file: !12, line: 73, column: 5)
!137 = !DILocation(line: 74, column: 17, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !136, file: !12, line: 75, type: !55)
!139 = !DILocation(line: 75, column: 16, scope: !136)
!140 = !DILocalVariable(name: "sourceLen", scope: !136, file: !12, line: 75, type: !55)
!141 = !DILocation(line: 75, column: 19, scope: !136)
!142 = !DILocation(line: 76, column: 28, scope: !136)
!143 = !DILocation(line: 76, column: 21, scope: !136)
!144 = !DILocation(line: 76, column: 19, scope: !136)
!145 = !DILocation(line: 79, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !136, file: !12, line: 79, column: 9)
!147 = !DILocation(line: 79, column: 14, scope: !146)
!148 = !DILocation(line: 79, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 79, column: 9)
!150 = !DILocation(line: 79, column: 25, scope: !149)
!151 = !DILocation(line: 79, column: 35, scope: !149)
!152 = !DILocation(line: 79, column: 23, scope: !149)
!153 = !DILocation(line: 79, column: 9, scope: !146)
!154 = !DILocation(line: 81, column: 30, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !12, line: 80, column: 9)
!156 = !DILocation(line: 81, column: 23, scope: !155)
!157 = !DILocation(line: 81, column: 13, scope: !155)
!158 = !DILocation(line: 81, column: 18, scope: !155)
!159 = !DILocation(line: 81, column: 21, scope: !155)
!160 = !DILocation(line: 82, column: 9, scope: !155)
!161 = !DILocation(line: 79, column: 41, scope: !149)
!162 = !DILocation(line: 79, column: 9, scope: !149)
!163 = distinct !{!163, !153, !164, !50}
!164 = !DILocation(line: 82, column: 9, scope: !146)
!165 = !DILocation(line: 83, column: 20, scope: !136)
!166 = !DILocation(line: 83, column: 9, scope: !136)
!167 = !DILocation(line: 85, column: 1, scope: !109)
