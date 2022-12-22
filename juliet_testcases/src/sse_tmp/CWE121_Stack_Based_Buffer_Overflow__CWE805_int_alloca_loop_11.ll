; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_bad() #0 !dbg !13 {
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
  %call = call i32 (...) @globalReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  store i32* %4, i32** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %6, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !55
  %8 = load i32, i32* %arrayidx, align 4, !dbg !55
  %9 = load i32*, i32** %data, align 8, !dbg !56
  %10 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !56
  store i32 %8, i32* %arrayidx1, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %11, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !65
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !65
  call void @printIntLine(i32 %13), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 200, align 16, !dbg !97
  %1 = bitcast i8* %0 to i32*, !dbg !98
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %2 = alloca i8, i64 400, align 16, !dbg !101
  %3 = bitcast i8* %2 to i32*, !dbg !102
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !100
  %call = call i32 (...) @globalReturnsFalse(), !dbg !103
  %tobool = icmp ne i32 %call, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end, !dbg !108

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !109
  store i32* %4, i32** %data, align 8, !dbg !111
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !121
  %cmp = icmp ult i64 %6, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !127
  %8 = load i32, i32* %arrayidx, align 4, !dbg !127
  %9 = load i32*, i32** %data, align 8, !dbg !128
  %10 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !128
  store i32 %8, i32* %arrayidx1, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %11, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !136
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !136
  call void @printIntLine(i32 %13), !dbg !137
  ret void, !dbg !138
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = alloca i8, i64 200, align 16, !dbg !144
  %1 = bitcast i8* %0 to i32*, !dbg !145
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %2 = alloca i8, i64 400, align 16, !dbg !148
  %3 = bitcast i8* %2 to i32*, !dbg !149
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !147
  %call = call i32 (...) @globalReturnsTrue(), !dbg !150
  %tobool = icmp ne i32 %call, 0, !dbg !150
  br i1 %tobool, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !153
  store i32* %4, i32** %data, align 8, !dbg !155
  br label %if.end, !dbg !156

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !157, metadata !DIExpression()), !dbg !159
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !DIExpression()), !dbg !162
  store i64 0, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !166
  %cmp = icmp ult i64 %6, 100, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !172
  %8 = load i32, i32* %arrayidx, align 4, !dbg !172
  %9 = load i32*, i32** %data, align 8, !dbg !173
  %10 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !173
  store i32 %8, i32* %arrayidx1, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %11, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !181
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !181
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !181
  call void @printIntLine(i32 %13), !dbg !182
  ret void, !dbg !183
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11.c", directory: "/root/SSE-Assessment")
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
!27 = !DILocation(line: 26, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 8)
!29 = !DILocation(line: 26, column: 8, scope: !13)
!30 = !DILocation(line: 30, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !14, line: 27, column: 5)
!32 = !DILocation(line: 30, column: 14, scope: !31)
!33 = !DILocation(line: 31, column: 5, scope: !31)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 33, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 33, column: 13, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !41, file: !14, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !35, file: !14, line: 34, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 35, column: 20, scope: !41)
!46 = !DILocation(line: 37, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !14, line: 37, column: 13)
!48 = !DILocation(line: 37, column: 18, scope: !47)
!49 = !DILocation(line: 37, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !14, line: 37, column: 13)
!51 = !DILocation(line: 37, column: 27, scope: !50)
!52 = !DILocation(line: 37, column: 13, scope: !47)
!53 = !DILocation(line: 39, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !14, line: 38, column: 13)
!55 = !DILocation(line: 39, column: 27, scope: !54)
!56 = !DILocation(line: 39, column: 17, scope: !54)
!57 = !DILocation(line: 39, column: 22, scope: !54)
!58 = !DILocation(line: 39, column: 25, scope: !54)
!59 = !DILocation(line: 40, column: 13, scope: !54)
!60 = !DILocation(line: 37, column: 35, scope: !50)
!61 = !DILocation(line: 37, column: 13, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 40, column: 13, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 41, column: 26, scope: !41)
!66 = !DILocation(line: 41, column: 13, scope: !41)
!67 = !DILocation(line: 44, column: 1, scope: !13)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_good", scope: !14, file: !14, line: 105, type: !15, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 107, column: 5, scope: !68)
!70 = !DILocation(line: 108, column: 5, scope: !68)
!71 = !DILocation(line: 109, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 121, type: !73, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!5, !5, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !14, line: 121, type: !5)
!79 = !DILocation(line: 121, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !14, line: 121, type: !75)
!81 = !DILocation(line: 121, column: 27, scope: !72)
!82 = !DILocation(line: 124, column: 22, scope: !72)
!83 = !DILocation(line: 124, column: 12, scope: !72)
!84 = !DILocation(line: 124, column: 5, scope: !72)
!85 = !DILocation(line: 126, column: 5, scope: !72)
!86 = !DILocation(line: 127, column: 5, scope: !72)
!87 = !DILocation(line: 128, column: 5, scope: !72)
!88 = !DILocation(line: 131, column: 5, scope: !72)
!89 = !DILocation(line: 132, column: 5, scope: !72)
!90 = !DILocation(line: 133, column: 5, scope: !72)
!91 = !DILocation(line: 135, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 53, type: !4)
!94 = !DILocation(line: 53, column: 11, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !14, line: 54, type: !4)
!96 = !DILocation(line: 54, column: 11, scope: !92)
!97 = !DILocation(line: 54, column: 34, scope: !92)
!98 = !DILocation(line: 54, column: 27, scope: !92)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !14, line: 55, type: !4)
!100 = !DILocation(line: 55, column: 11, scope: !92)
!101 = !DILocation(line: 55, column: 35, scope: !92)
!102 = !DILocation(line: 55, column: 28, scope: !92)
!103 = !DILocation(line: 56, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !92, file: !14, line: 56, column: 8)
!105 = !DILocation(line: 56, column: 8, scope: !92)
!106 = !DILocation(line: 59, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !14, line: 57, column: 5)
!108 = !DILocation(line: 60, column: 5, scope: !107)
!109 = !DILocation(line: 64, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !14, line: 62, column: 5)
!111 = !DILocation(line: 64, column: 14, scope: !110)
!112 = !DILocalVariable(name: "source", scope: !113, file: !14, line: 67, type: !36)
!113 = distinct !DILexicalBlock(scope: !92, file: !14, line: 66, column: 5)
!114 = !DILocation(line: 67, column: 13, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !14, line: 69, type: !42)
!116 = distinct !DILexicalBlock(scope: !113, file: !14, line: 68, column: 9)
!117 = !DILocation(line: 69, column: 20, scope: !116)
!118 = !DILocation(line: 71, column: 20, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !14, line: 71, column: 13)
!120 = !DILocation(line: 71, column: 18, scope: !119)
!121 = !DILocation(line: 71, column: 25, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !14, line: 71, column: 13)
!123 = !DILocation(line: 71, column: 27, scope: !122)
!124 = !DILocation(line: 71, column: 13, scope: !119)
!125 = !DILocation(line: 73, column: 34, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !14, line: 72, column: 13)
!127 = !DILocation(line: 73, column: 27, scope: !126)
!128 = !DILocation(line: 73, column: 17, scope: !126)
!129 = !DILocation(line: 73, column: 22, scope: !126)
!130 = !DILocation(line: 73, column: 25, scope: !126)
!131 = !DILocation(line: 74, column: 13, scope: !126)
!132 = !DILocation(line: 71, column: 35, scope: !122)
!133 = !DILocation(line: 71, column: 13, scope: !122)
!134 = distinct !{!134, !124, !135, !64}
!135 = !DILocation(line: 74, column: 13, scope: !119)
!136 = !DILocation(line: 75, column: 26, scope: !116)
!137 = !DILocation(line: 75, column: 13, scope: !116)
!138 = !DILocation(line: 78, column: 1, scope: !92)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", scope: !139, file: !14, line: 83, type: !4)
!141 = !DILocation(line: 83, column: 11, scope: !139)
!142 = !DILocalVariable(name: "dataBadBuffer", scope: !139, file: !14, line: 84, type: !4)
!143 = !DILocation(line: 84, column: 11, scope: !139)
!144 = !DILocation(line: 84, column: 34, scope: !139)
!145 = !DILocation(line: 84, column: 27, scope: !139)
!146 = !DILocalVariable(name: "dataGoodBuffer", scope: !139, file: !14, line: 85, type: !4)
!147 = !DILocation(line: 85, column: 11, scope: !139)
!148 = !DILocation(line: 85, column: 35, scope: !139)
!149 = !DILocation(line: 85, column: 28, scope: !139)
!150 = !DILocation(line: 86, column: 8, scope: !151)
!151 = distinct !DILexicalBlock(scope: !139, file: !14, line: 86, column: 8)
!152 = !DILocation(line: 86, column: 8, scope: !139)
!153 = !DILocation(line: 89, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !14, line: 87, column: 5)
!155 = !DILocation(line: 89, column: 14, scope: !154)
!156 = !DILocation(line: 90, column: 5, scope: !154)
!157 = !DILocalVariable(name: "source", scope: !158, file: !14, line: 92, type: !36)
!158 = distinct !DILexicalBlock(scope: !139, file: !14, line: 91, column: 5)
!159 = !DILocation(line: 92, column: 13, scope: !158)
!160 = !DILocalVariable(name: "i", scope: !161, file: !14, line: 94, type: !42)
!161 = distinct !DILexicalBlock(scope: !158, file: !14, line: 93, column: 9)
!162 = !DILocation(line: 94, column: 20, scope: !161)
!163 = !DILocation(line: 96, column: 20, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !14, line: 96, column: 13)
!165 = !DILocation(line: 96, column: 18, scope: !164)
!166 = !DILocation(line: 96, column: 25, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !14, line: 96, column: 13)
!168 = !DILocation(line: 96, column: 27, scope: !167)
!169 = !DILocation(line: 96, column: 13, scope: !164)
!170 = !DILocation(line: 98, column: 34, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !14, line: 97, column: 13)
!172 = !DILocation(line: 98, column: 27, scope: !171)
!173 = !DILocation(line: 98, column: 17, scope: !171)
!174 = !DILocation(line: 98, column: 22, scope: !171)
!175 = !DILocation(line: 98, column: 25, scope: !171)
!176 = !DILocation(line: 99, column: 13, scope: !171)
!177 = !DILocation(line: 96, column: 35, scope: !167)
!178 = !DILocation(line: 96, column: 13, scope: !167)
!179 = distinct !{!179, !169, !180, !64}
!180 = !DILocation(line: 99, column: 13, scope: !164)
!181 = !DILocation(line: 100, column: 26, scope: !161)
!182 = !DILocation(line: 100, column: 13, scope: !161)
!183 = !DILocation(line: 103, column: 1, scope: !139)
