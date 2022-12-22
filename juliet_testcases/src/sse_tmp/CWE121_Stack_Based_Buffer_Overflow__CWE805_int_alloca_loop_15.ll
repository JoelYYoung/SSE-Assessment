; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_15_bad() #0 !dbg !13 {
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
  store i32* %4, i32** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %6, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !50
  %8 = load i32, i32* %arrayidx, align 4, !dbg !50
  %9 = load i32*, i32** %data, align 8, !dbg !51
  %10 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !51
  store i32 %8, i32* %arrayidx1, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %11, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !60
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !60
  call void @printIntLine(i32 %13), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_15_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_15_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_15_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 200, align 16, !dbg !92
  %1 = bitcast i8* %0 to i32*, !dbg !93
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %2 = alloca i8, i64 400, align 16, !dbg !96
  %3 = bitcast i8* %2 to i32*, !dbg !97
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !95
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !98
  store i32* %4, i32** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !102
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !109
  %cmp = icmp ult i64 %6, 100, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !115
  %8 = load i32, i32* %arrayidx, align 4, !dbg !115
  %9 = load i32*, i32** %data, align 8, !dbg !116
  %10 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !116
  store i32 %8, i32* %arrayidx1, align 4, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !120
  %inc = add i64 %11, 1, !dbg !120
  store i64 %inc, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !124
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !124
  call void @printIntLine(i32 %13), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !127 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = alloca i8, i64 200, align 16, !dbg !132
  %1 = bitcast i8* %0 to i32*, !dbg !133
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  %2 = alloca i8, i64 400, align 16, !dbg !136
  %3 = bitcast i8* %2 to i32*, !dbg !137
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !135
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !138
  store i32* %4, i32** %data, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !149
  %cmp = icmp ult i64 %6, 100, !dbg !151
  br i1 %cmp, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !155
  %8 = load i32, i32* %arrayidx, align 4, !dbg !155
  %9 = load i32*, i32** %data, align 8, !dbg !156
  %10 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !156
  store i32 %8, i32* %arrayidx1, align 4, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %11, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !164
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !164
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !164
  call void @printIntLine(i32 %13), !dbg !165
  ret void, !dbg !166
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_15.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_15_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_15.c", directory: "/root/SSE-Assessment")
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
!27 = !DILocation(line: 31, column: 16, scope: !13)
!28 = !DILocation(line: 31, column: 14, scope: !13)
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 39, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 39, column: 13, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !36, file: !14, line: 41, type: !37)
!36 = distinct !DILexicalBlock(scope: !30, file: !14, line: 40, column: 9)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 41, column: 20, scope: !36)
!41 = !DILocation(line: 43, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !14, line: 43, column: 13)
!43 = !DILocation(line: 43, column: 18, scope: !42)
!44 = !DILocation(line: 43, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !14, line: 43, column: 13)
!46 = !DILocation(line: 43, column: 27, scope: !45)
!47 = !DILocation(line: 43, column: 13, scope: !42)
!48 = !DILocation(line: 45, column: 34, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !14, line: 44, column: 13)
!50 = !DILocation(line: 45, column: 27, scope: !49)
!51 = !DILocation(line: 45, column: 17, scope: !49)
!52 = !DILocation(line: 45, column: 22, scope: !49)
!53 = !DILocation(line: 45, column: 25, scope: !49)
!54 = !DILocation(line: 46, column: 13, scope: !49)
!55 = !DILocation(line: 43, column: 35, scope: !45)
!56 = !DILocation(line: 43, column: 13, scope: !45)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 46, column: 13, scope: !42)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 47, column: 26, scope: !36)
!61 = !DILocation(line: 47, column: 13, scope: !36)
!62 = !DILocation(line: 50, column: 1, scope: !13)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_15_good", scope: !14, file: !14, line: 118, type: !15, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 120, column: 5, scope: !63)
!65 = !DILocation(line: 121, column: 5, scope: !63)
!66 = !DILocation(line: 122, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 134, type: !68, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!5, !5, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !14, line: 134, type: !5)
!74 = !DILocation(line: 134, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !14, line: 134, type: !70)
!76 = !DILocation(line: 134, column: 27, scope: !67)
!77 = !DILocation(line: 137, column: 22, scope: !67)
!78 = !DILocation(line: 137, column: 12, scope: !67)
!79 = !DILocation(line: 137, column: 5, scope: !67)
!80 = !DILocation(line: 139, column: 5, scope: !67)
!81 = !DILocation(line: 140, column: 5, scope: !67)
!82 = !DILocation(line: 141, column: 5, scope: !67)
!83 = !DILocation(line: 144, column: 5, scope: !67)
!84 = !DILocation(line: 145, column: 5, scope: !67)
!85 = !DILocation(line: 146, column: 5, scope: !67)
!86 = !DILocation(line: 148, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !14, line: 59, type: !4)
!89 = !DILocation(line: 59, column: 11, scope: !87)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !14, line: 60, type: !4)
!91 = !DILocation(line: 60, column: 11, scope: !87)
!92 = !DILocation(line: 60, column: 34, scope: !87)
!93 = !DILocation(line: 60, column: 27, scope: !87)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !14, line: 61, type: !4)
!95 = !DILocation(line: 61, column: 11, scope: !87)
!96 = !DILocation(line: 61, column: 35, scope: !87)
!97 = !DILocation(line: 61, column: 28, scope: !87)
!98 = !DILocation(line: 70, column: 16, scope: !87)
!99 = !DILocation(line: 70, column: 14, scope: !87)
!100 = !DILocalVariable(name: "source", scope: !101, file: !14, line: 74, type: !31)
!101 = distinct !DILexicalBlock(scope: !87, file: !14, line: 73, column: 5)
!102 = !DILocation(line: 74, column: 13, scope: !101)
!103 = !DILocalVariable(name: "i", scope: !104, file: !14, line: 76, type: !37)
!104 = distinct !DILexicalBlock(scope: !101, file: !14, line: 75, column: 9)
!105 = !DILocation(line: 76, column: 20, scope: !104)
!106 = !DILocation(line: 78, column: 20, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !14, line: 78, column: 13)
!108 = !DILocation(line: 78, column: 18, scope: !107)
!109 = !DILocation(line: 78, column: 25, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !14, line: 78, column: 13)
!111 = !DILocation(line: 78, column: 27, scope: !110)
!112 = !DILocation(line: 78, column: 13, scope: !107)
!113 = !DILocation(line: 80, column: 34, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !14, line: 79, column: 13)
!115 = !DILocation(line: 80, column: 27, scope: !114)
!116 = !DILocation(line: 80, column: 17, scope: !114)
!117 = !DILocation(line: 80, column: 22, scope: !114)
!118 = !DILocation(line: 80, column: 25, scope: !114)
!119 = !DILocation(line: 81, column: 13, scope: !114)
!120 = !DILocation(line: 78, column: 35, scope: !110)
!121 = !DILocation(line: 78, column: 13, scope: !110)
!122 = distinct !{!122, !112, !123, !59}
!123 = !DILocation(line: 81, column: 13, scope: !107)
!124 = !DILocation(line: 82, column: 26, scope: !104)
!125 = !DILocation(line: 82, column: 13, scope: !104)
!126 = !DILocation(line: 85, column: 1, scope: !87)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DILocalVariable(name: "data", scope: !127, file: !14, line: 90, type: !4)
!129 = !DILocation(line: 90, column: 11, scope: !127)
!130 = !DILocalVariable(name: "dataBadBuffer", scope: !127, file: !14, line: 91, type: !4)
!131 = !DILocation(line: 91, column: 11, scope: !127)
!132 = !DILocation(line: 91, column: 34, scope: !127)
!133 = !DILocation(line: 91, column: 27, scope: !127)
!134 = !DILocalVariable(name: "dataGoodBuffer", scope: !127, file: !14, line: 92, type: !4)
!135 = !DILocation(line: 92, column: 11, scope: !127)
!136 = !DILocation(line: 92, column: 35, scope: !127)
!137 = !DILocation(line: 92, column: 28, scope: !127)
!138 = !DILocation(line: 97, column: 16, scope: !127)
!139 = !DILocation(line: 97, column: 14, scope: !127)
!140 = !DILocalVariable(name: "source", scope: !141, file: !14, line: 105, type: !31)
!141 = distinct !DILexicalBlock(scope: !127, file: !14, line: 104, column: 5)
!142 = !DILocation(line: 105, column: 13, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !144, file: !14, line: 107, type: !37)
!144 = distinct !DILexicalBlock(scope: !141, file: !14, line: 106, column: 9)
!145 = !DILocation(line: 107, column: 20, scope: !144)
!146 = !DILocation(line: 109, column: 20, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !14, line: 109, column: 13)
!148 = !DILocation(line: 109, column: 18, scope: !147)
!149 = !DILocation(line: 109, column: 25, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !14, line: 109, column: 13)
!151 = !DILocation(line: 109, column: 27, scope: !150)
!152 = !DILocation(line: 109, column: 13, scope: !147)
!153 = !DILocation(line: 111, column: 34, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !14, line: 110, column: 13)
!155 = !DILocation(line: 111, column: 27, scope: !154)
!156 = !DILocation(line: 111, column: 17, scope: !154)
!157 = !DILocation(line: 111, column: 22, scope: !154)
!158 = !DILocation(line: 111, column: 25, scope: !154)
!159 = !DILocation(line: 112, column: 13, scope: !154)
!160 = !DILocation(line: 109, column: 35, scope: !150)
!161 = !DILocation(line: 109, column: 13, scope: !150)
!162 = distinct !{!162, !152, !163, !59}
!163 = !DILocation(line: 112, column: 13, scope: !147)
!164 = !DILocation(line: 113, column: 26, scope: !144)
!165 = !DILocation(line: 113, column: 13, scope: !144)
!166 = !DILocation(line: 116, column: 1, scope: !127)
