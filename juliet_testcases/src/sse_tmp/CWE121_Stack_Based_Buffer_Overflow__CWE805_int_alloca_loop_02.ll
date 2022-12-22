; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_02_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !27
  store i32* %4, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %6, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !52
  %8 = load i32, i32* %arrayidx, align 4, !dbg !52
  %9 = load i32*, i32** %data, align 8, !dbg !53
  %10 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !53
  store i32 %8, i32* %arrayidx1, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %11, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !62
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !62
  call void @printIntLine(i32 %13), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_02_good() #0 !dbg !65 {
entry:
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #5, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #5, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_02_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_02_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 200, align 16, !dbg !94
  %1 = bitcast i8* %0 to i32*, !dbg !95
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %2 = alloca i8, i64 400, align 16, !dbg !98
  %3 = bitcast i8* %2 to i32*, !dbg !99
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !97
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !100
  store i32* %4, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !109
  store i64 0, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !113
  %cmp = icmp ult i64 %6, 100, !dbg !115
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !119
  %8 = load i32, i32* %arrayidx, align 4, !dbg !119
  %9 = load i32*, i32** %data, align 8, !dbg !120
  %10 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !120
  store i32 %8, i32* %arrayidx1, align 4, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %11, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !128
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !128
  call void @printIntLine(i32 %13), !dbg !129
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !131 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  %0 = alloca i8, i64 200, align 16, !dbg !136
  %1 = bitcast i8* %0 to i32*, !dbg !137
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %2 = alloca i8, i64 400, align 16, !dbg !140
  %3 = bitcast i8* %2 to i32*, !dbg !141
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !139
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !142
  store i32* %4, i32** %data, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !146, metadata !DIExpression()), !dbg !148
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !148
  call void @llvm.dbg.declare(metadata i64* %i, metadata !149, metadata !DIExpression()), !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !155
  %cmp = icmp ult i64 %6, 100, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !161
  %8 = load i32, i32* %arrayidx, align 4, !dbg !161
  %9 = load i32*, i32** %data, align 8, !dbg !162
  %10 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !162
  store i32 %8, i32* %arrayidx1, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %11, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !170
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !170
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !170
  call void @printIntLine(i32 %13), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_02.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_02_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_02.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 24, column: 34, scope: !13)
!22 = !DILocation(line: 24, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !4)
!24 = !DILocation(line: 25, column: 11, scope: !13)
!25 = !DILocation(line: 25, column: 35, scope: !13)
!26 = !DILocation(line: 25, column: 28, scope: !13)
!27 = !DILocation(line: 30, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !14, line: 27, column: 5)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 8)
!30 = !DILocation(line: 30, column: 14, scope: !28)
!31 = !DILocalVariable(name: "source", scope: !32, file: !14, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 13, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !38, file: !14, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !32, file: !14, line: 34, column: 9)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 35, column: 20, scope: !38)
!43 = !DILocation(line: 37, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !14, line: 37, column: 13)
!45 = !DILocation(line: 37, column: 18, scope: !44)
!46 = !DILocation(line: 37, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !14, line: 37, column: 13)
!48 = !DILocation(line: 37, column: 27, scope: !47)
!49 = !DILocation(line: 37, column: 13, scope: !44)
!50 = !DILocation(line: 39, column: 34, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !14, line: 38, column: 13)
!52 = !DILocation(line: 39, column: 27, scope: !51)
!53 = !DILocation(line: 39, column: 17, scope: !51)
!54 = !DILocation(line: 39, column: 22, scope: !51)
!55 = !DILocation(line: 39, column: 25, scope: !51)
!56 = !DILocation(line: 40, column: 13, scope: !51)
!57 = !DILocation(line: 37, column: 35, scope: !47)
!58 = !DILocation(line: 37, column: 13, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 40, column: 13, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 41, column: 26, scope: !38)
!63 = !DILocation(line: 41, column: 13, scope: !38)
!64 = !DILocation(line: 44, column: 1, scope: !13)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_02_good", scope: !14, file: !14, line: 105, type: !15, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 107, column: 5, scope: !65)
!67 = !DILocation(line: 108, column: 5, scope: !65)
!68 = !DILocation(line: 109, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 121, type: !70, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!5, !5, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !14, line: 121, type: !5)
!76 = !DILocation(line: 121, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !14, line: 121, type: !72)
!78 = !DILocation(line: 121, column: 27, scope: !69)
!79 = !DILocation(line: 124, column: 22, scope: !69)
!80 = !DILocation(line: 124, column: 12, scope: !69)
!81 = !DILocation(line: 124, column: 5, scope: !69)
!82 = !DILocation(line: 126, column: 5, scope: !69)
!83 = !DILocation(line: 127, column: 5, scope: !69)
!84 = !DILocation(line: 128, column: 5, scope: !69)
!85 = !DILocation(line: 131, column: 5, scope: !69)
!86 = !DILocation(line: 132, column: 5, scope: !69)
!87 = !DILocation(line: 133, column: 5, scope: !69)
!88 = !DILocation(line: 135, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !14, line: 53, type: !4)
!91 = !DILocation(line: 53, column: 11, scope: !89)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !14, line: 54, type: !4)
!93 = !DILocation(line: 54, column: 11, scope: !89)
!94 = !DILocation(line: 54, column: 34, scope: !89)
!95 = !DILocation(line: 54, column: 27, scope: !89)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !14, line: 55, type: !4)
!97 = !DILocation(line: 55, column: 11, scope: !89)
!98 = !DILocation(line: 55, column: 35, scope: !89)
!99 = !DILocation(line: 55, column: 28, scope: !89)
!100 = !DILocation(line: 64, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !14, line: 62, column: 5)
!102 = distinct !DILexicalBlock(scope: !89, file: !14, line: 56, column: 8)
!103 = !DILocation(line: 64, column: 14, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !14, line: 67, type: !33)
!105 = distinct !DILexicalBlock(scope: !89, file: !14, line: 66, column: 5)
!106 = !DILocation(line: 67, column: 13, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !108, file: !14, line: 69, type: !39)
!108 = distinct !DILexicalBlock(scope: !105, file: !14, line: 68, column: 9)
!109 = !DILocation(line: 69, column: 20, scope: !108)
!110 = !DILocation(line: 71, column: 20, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !14, line: 71, column: 13)
!112 = !DILocation(line: 71, column: 18, scope: !111)
!113 = !DILocation(line: 71, column: 25, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !14, line: 71, column: 13)
!115 = !DILocation(line: 71, column: 27, scope: !114)
!116 = !DILocation(line: 71, column: 13, scope: !111)
!117 = !DILocation(line: 73, column: 34, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !14, line: 72, column: 13)
!119 = !DILocation(line: 73, column: 27, scope: !118)
!120 = !DILocation(line: 73, column: 17, scope: !118)
!121 = !DILocation(line: 73, column: 22, scope: !118)
!122 = !DILocation(line: 73, column: 25, scope: !118)
!123 = !DILocation(line: 74, column: 13, scope: !118)
!124 = !DILocation(line: 71, column: 35, scope: !114)
!125 = !DILocation(line: 71, column: 13, scope: !114)
!126 = distinct !{!126, !116, !127, !61}
!127 = !DILocation(line: 74, column: 13, scope: !111)
!128 = !DILocation(line: 75, column: 26, scope: !108)
!129 = !DILocation(line: 75, column: 13, scope: !108)
!130 = !DILocation(line: 78, column: 1, scope: !89)
!131 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocalVariable(name: "data", scope: !131, file: !14, line: 83, type: !4)
!133 = !DILocation(line: 83, column: 11, scope: !131)
!134 = !DILocalVariable(name: "dataBadBuffer", scope: !131, file: !14, line: 84, type: !4)
!135 = !DILocation(line: 84, column: 11, scope: !131)
!136 = !DILocation(line: 84, column: 34, scope: !131)
!137 = !DILocation(line: 84, column: 27, scope: !131)
!138 = !DILocalVariable(name: "dataGoodBuffer", scope: !131, file: !14, line: 85, type: !4)
!139 = !DILocation(line: 85, column: 11, scope: !131)
!140 = !DILocation(line: 85, column: 35, scope: !131)
!141 = !DILocation(line: 85, column: 28, scope: !131)
!142 = !DILocation(line: 89, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !144, file: !14, line: 87, column: 5)
!144 = distinct !DILexicalBlock(scope: !131, file: !14, line: 86, column: 8)
!145 = !DILocation(line: 89, column: 14, scope: !143)
!146 = !DILocalVariable(name: "source", scope: !147, file: !14, line: 92, type: !33)
!147 = distinct !DILexicalBlock(scope: !131, file: !14, line: 91, column: 5)
!148 = !DILocation(line: 92, column: 13, scope: !147)
!149 = !DILocalVariable(name: "i", scope: !150, file: !14, line: 94, type: !39)
!150 = distinct !DILexicalBlock(scope: !147, file: !14, line: 93, column: 9)
!151 = !DILocation(line: 94, column: 20, scope: !150)
!152 = !DILocation(line: 96, column: 20, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !14, line: 96, column: 13)
!154 = !DILocation(line: 96, column: 18, scope: !153)
!155 = !DILocation(line: 96, column: 25, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !14, line: 96, column: 13)
!157 = !DILocation(line: 96, column: 27, scope: !156)
!158 = !DILocation(line: 96, column: 13, scope: !153)
!159 = !DILocation(line: 98, column: 34, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !14, line: 97, column: 13)
!161 = !DILocation(line: 98, column: 27, scope: !160)
!162 = !DILocation(line: 98, column: 17, scope: !160)
!163 = !DILocation(line: 98, column: 22, scope: !160)
!164 = !DILocation(line: 98, column: 25, scope: !160)
!165 = !DILocation(line: 99, column: 13, scope: !160)
!166 = !DILocation(line: 96, column: 35, scope: !156)
!167 = !DILocation(line: 96, column: 13, scope: !156)
!168 = distinct !{!168, !158, !169, !61}
!169 = !DILocation(line: 99, column: 13, scope: !153)
!170 = !DILocation(line: 100, column: 26, scope: !150)
!171 = !DILocation(line: 100, column: 13, scope: !150)
!172 = !DILocation(line: 103, column: 1, scope: !131)
