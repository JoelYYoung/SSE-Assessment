; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i1 = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 10, align 16, !dbg !24
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %1 = alloca i8, i64 11, align 16, !dbg !27
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !26
  store i32 0, i32* %i, align 4, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !31
  %cmp = icmp slt i32 %2, 1, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !35
  store i8* %3, i8** %data, align 8, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %5, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !57, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !59
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !60
  store i64 %call, i64* %sourceLen, align 8, !dbg !61
  store i64 0, i64* %i1, align 8, !dbg !62
  br label %for.cond2, !dbg !64

for.cond2:                                        ; preds = %for.inc7, %for.end
  %7 = load i64, i64* %i1, align 8, !dbg !65
  %8 = load i64, i64* %sourceLen, align 8, !dbg !67
  %add = add i64 %8, 1, !dbg !68
  %cmp3 = icmp ult i64 %7, %add, !dbg !69
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !70

for.body4:                                        ; preds = %for.cond2
  %9 = load i64, i64* %i1, align 8, !dbg !71
  %arrayidx5 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !73
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !73
  %11 = load i8*, i8** %data, align 8, !dbg !74
  %12 = load i64, i64* %i1, align 8, !dbg !75
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !74
  store i8 %10, i8* %arrayidx6, align 1, !dbg !76
  br label %for.inc7, !dbg !77

for.inc7:                                         ; preds = %for.body4
  %13 = load i64, i64* %i1, align 8, !dbg !78
  %inc8 = add i64 %13, 1, !dbg !78
  store i64 %inc8, i64* %i1, align 8, !dbg !78
  br label %for.cond2, !dbg !79, !llvm.loop !80

for.end9:                                         ; preds = %for.cond2
  %14 = load i8*, i8** %data, align 8, !dbg !82
  call void @printLine(i8* %14), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 10, align 16, !dbg !113
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %1 = alloca i8, i64 11, align 16, !dbg !116
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !115
  store i32 0, i32* %h, align 4, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !120
  %cmp = icmp slt i32 %2, 1, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  store i8* %3, i8** %data, align 8, !dbg !126
  %4 = load i8*, i8** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !130
  %inc = add nsw i32 %5, 1, !dbg !130
  store i32 %inc, i32* %h, align 4, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !136
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !141
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !142
  store i64 %call, i64* %sourceLen, align 8, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond1, !dbg !146

for.cond1:                                        ; preds = %for.inc6, %for.end
  %7 = load i64, i64* %i, align 8, !dbg !147
  %8 = load i64, i64* %sourceLen, align 8, !dbg !149
  %add = add i64 %8, 1, !dbg !150
  %cmp2 = icmp ult i64 %7, %add, !dbg !151
  br i1 %cmp2, label %for.body3, label %for.end8, !dbg !152

for.body3:                                        ; preds = %for.cond1
  %9 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !155
  %10 = load i8, i8* %arrayidx4, align 1, !dbg !155
  %11 = load i8*, i8** %data, align 8, !dbg !156
  %12 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !156
  store i8 %10, i8* %arrayidx5, align 1, !dbg !158
  br label %for.inc6, !dbg !159

for.inc6:                                         ; preds = %for.body3
  %13 = load i64, i64* %i, align 8, !dbg !160
  %inc7 = add i64 %13, 1, !dbg !160
  store i64 %inc7, i64* %i, align 8, !dbg !160
  br label %for.cond1, !dbg !161, !llvm.loop !162

for.end8:                                         ; preds = %for.cond1
  %14 = load i8*, i8** %data, align 8, !dbg !164
  call void @printLine(i8* %14), !dbg !165
  ret void, !dbg !166
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 30, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 30, column: 9, scope: !13)
!20 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 36, scope: !13)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 33, type: !4)
!26 = !DILocation(line: 33, column: 12, scope: !13)
!27 = !DILocation(line: 33, column: 37, scope: !13)
!28 = !DILocation(line: 34, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!30 = !DILocation(line: 34, column: 9, scope: !29)
!31 = !DILocation(line: 34, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !14, line: 34, column: 5)
!33 = !DILocation(line: 34, column: 18, scope: !32)
!34 = !DILocation(line: 34, column: 5, scope: !29)
!35 = !DILocation(line: 38, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !14, line: 35, column: 5)
!37 = !DILocation(line: 38, column: 14, scope: !36)
!38 = !DILocation(line: 39, column: 9, scope: !36)
!39 = !DILocation(line: 39, column: 17, scope: !36)
!40 = !DILocation(line: 40, column: 5, scope: !36)
!41 = !DILocation(line: 34, column: 24, scope: !32)
!42 = !DILocation(line: 34, column: 5, scope: !32)
!43 = distinct !{!43, !34, !44, !45}
!44 = !DILocation(line: 40, column: 5, scope: !29)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocalVariable(name: "source", scope: !47, file: !14, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 11)
!51 = !DILocation(line: 42, column: 14, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !14, line: 43, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 43, column: 16, scope: !47)
!57 = !DILocalVariable(name: "sourceLen", scope: !47, file: !14, line: 43, type: !53)
!58 = !DILocation(line: 43, column: 19, scope: !47)
!59 = !DILocation(line: 44, column: 28, scope: !47)
!60 = !DILocation(line: 44, column: 21, scope: !47)
!61 = !DILocation(line: 44, column: 19, scope: !47)
!62 = !DILocation(line: 47, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !47, file: !14, line: 47, column: 9)
!64 = !DILocation(line: 47, column: 14, scope: !63)
!65 = !DILocation(line: 47, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !14, line: 47, column: 9)
!67 = !DILocation(line: 47, column: 25, scope: !66)
!68 = !DILocation(line: 47, column: 35, scope: !66)
!69 = !DILocation(line: 47, column: 23, scope: !66)
!70 = !DILocation(line: 47, column: 9, scope: !63)
!71 = !DILocation(line: 49, column: 30, scope: !72)
!72 = distinct !DILexicalBlock(scope: !66, file: !14, line: 48, column: 9)
!73 = !DILocation(line: 49, column: 23, scope: !72)
!74 = !DILocation(line: 49, column: 13, scope: !72)
!75 = !DILocation(line: 49, column: 18, scope: !72)
!76 = !DILocation(line: 49, column: 21, scope: !72)
!77 = !DILocation(line: 50, column: 9, scope: !72)
!78 = !DILocation(line: 47, column: 41, scope: !66)
!79 = !DILocation(line: 47, column: 9, scope: !66)
!80 = distinct !{!80, !70, !81, !45}
!81 = !DILocation(line: 50, column: 9, scope: !63)
!82 = !DILocation(line: 51, column: 19, scope: !47)
!83 = !DILocation(line: 51, column: 9, scope: !47)
!84 = !DILocation(line: 53, column: 1, scope: !13)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 89, column: 5, scope: !85)
!87 = !DILocation(line: 90, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 102, type: !89, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!18, !18, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !14, line: 102, type: !18)
!93 = !DILocation(line: 102, column: 14, scope: !88)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !14, line: 102, type: !91)
!95 = !DILocation(line: 102, column: 27, scope: !88)
!96 = !DILocation(line: 105, column: 22, scope: !88)
!97 = !DILocation(line: 105, column: 12, scope: !88)
!98 = !DILocation(line: 105, column: 5, scope: !88)
!99 = !DILocation(line: 107, column: 5, scope: !88)
!100 = !DILocation(line: 108, column: 5, scope: !88)
!101 = !DILocation(line: 109, column: 5, scope: !88)
!102 = !DILocation(line: 112, column: 5, scope: !88)
!103 = !DILocation(line: 113, column: 5, scope: !88)
!104 = !DILocation(line: 114, column: 5, scope: !88)
!105 = !DILocation(line: 116, column: 5, scope: !88)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "h", scope: !106, file: !14, line: 62, type: !18)
!108 = !DILocation(line: 62, column: 9, scope: !106)
!109 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 63, type: !4)
!110 = !DILocation(line: 63, column: 12, scope: !106)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !14, line: 64, type: !4)
!112 = !DILocation(line: 64, column: 12, scope: !106)
!113 = !DILocation(line: 64, column: 36, scope: !106)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !14, line: 65, type: !4)
!115 = !DILocation(line: 65, column: 12, scope: !106)
!116 = !DILocation(line: 65, column: 37, scope: !106)
!117 = !DILocation(line: 66, column: 11, scope: !118)
!118 = distinct !DILexicalBlock(scope: !106, file: !14, line: 66, column: 5)
!119 = !DILocation(line: 66, column: 9, scope: !118)
!120 = !DILocation(line: 66, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !14, line: 66, column: 5)
!122 = !DILocation(line: 66, column: 18, scope: !121)
!123 = !DILocation(line: 66, column: 5, scope: !118)
!124 = !DILocation(line: 70, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !14, line: 67, column: 5)
!126 = !DILocation(line: 70, column: 14, scope: !125)
!127 = !DILocation(line: 71, column: 9, scope: !125)
!128 = !DILocation(line: 71, column: 17, scope: !125)
!129 = !DILocation(line: 72, column: 5, scope: !125)
!130 = !DILocation(line: 66, column: 24, scope: !121)
!131 = !DILocation(line: 66, column: 5, scope: !121)
!132 = distinct !{!132, !123, !133, !45}
!133 = !DILocation(line: 72, column: 5, scope: !118)
!134 = !DILocalVariable(name: "source", scope: !135, file: !14, line: 74, type: !48)
!135 = distinct !DILexicalBlock(scope: !106, file: !14, line: 73, column: 5)
!136 = !DILocation(line: 74, column: 14, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !135, file: !14, line: 75, type: !53)
!138 = !DILocation(line: 75, column: 16, scope: !135)
!139 = !DILocalVariable(name: "sourceLen", scope: !135, file: !14, line: 75, type: !53)
!140 = !DILocation(line: 75, column: 19, scope: !135)
!141 = !DILocation(line: 76, column: 28, scope: !135)
!142 = !DILocation(line: 76, column: 21, scope: !135)
!143 = !DILocation(line: 76, column: 19, scope: !135)
!144 = !DILocation(line: 79, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !14, line: 79, column: 9)
!146 = !DILocation(line: 79, column: 14, scope: !145)
!147 = !DILocation(line: 79, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !14, line: 79, column: 9)
!149 = !DILocation(line: 79, column: 25, scope: !148)
!150 = !DILocation(line: 79, column: 35, scope: !148)
!151 = !DILocation(line: 79, column: 23, scope: !148)
!152 = !DILocation(line: 79, column: 9, scope: !145)
!153 = !DILocation(line: 81, column: 30, scope: !154)
!154 = distinct !DILexicalBlock(scope: !148, file: !14, line: 80, column: 9)
!155 = !DILocation(line: 81, column: 23, scope: !154)
!156 = !DILocation(line: 81, column: 13, scope: !154)
!157 = !DILocation(line: 81, column: 18, scope: !154)
!158 = !DILocation(line: 81, column: 21, scope: !154)
!159 = !DILocation(line: 82, column: 9, scope: !154)
!160 = !DILocation(line: 79, column: 41, scope: !148)
!161 = !DILocation(line: 79, column: 9, scope: !148)
!162 = distinct !{!162, !152, !163, !45}
!163 = !DILocation(line: 82, column: 9, scope: !145)
!164 = !DILocation(line: 83, column: 19, scope: !135)
!165 = !DILocation(line: 83, column: 9, scope: !135)
!166 = !DILocation(line: 85, column: 1, scope: !106)
