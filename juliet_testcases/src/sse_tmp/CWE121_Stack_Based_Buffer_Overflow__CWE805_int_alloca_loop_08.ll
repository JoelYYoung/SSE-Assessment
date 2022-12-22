; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_08_bad() #0 !dbg !13 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !27
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_08_good() #0 !dbg !68 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_08_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_08_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !92 {
entry:
  ret i32 1, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 200, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %2 = alloca i8, i64 400, align 16, !dbg !105
  %3 = bitcast i8* %2 to i32*, !dbg !106
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !104
  %call = call i32 @staticReturnsFalse(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !113
  store i32* %4, i32** %data, align 8, !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !125
  %cmp = icmp ult i64 %6, 100, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !131
  %8 = load i32, i32* %arrayidx, align 4, !dbg !131
  %9 = load i32*, i32** %data, align 8, !dbg !132
  %10 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !132
  store i32 %8, i32* %arrayidx1, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %11, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !140
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !140
  call void @printIntLine(i32 %13), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !143 {
entry:
  ret i32 0, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = alloca i8, i64 200, align 16, !dbg !150
  %1 = bitcast i8* %0 to i32*, !dbg !151
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  %2 = alloca i8, i64 400, align 16, !dbg !154
  %3 = bitcast i8* %2 to i32*, !dbg !155
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !153
  %call = call i32 @staticReturnsTrue(), !dbg !156
  %tobool = icmp ne i32 %call, 0, !dbg !156
  br i1 %tobool, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !159
  store i32* %4, i32** %data, align 8, !dbg !161
  br label %if.end, !dbg !162

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !163, metadata !DIExpression()), !dbg !165
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !165
  call void @llvm.dbg.declare(metadata i64* %i, metadata !166, metadata !DIExpression()), !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !172
  %cmp = icmp ult i64 %6, 100, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !178
  %8 = load i32, i32* %arrayidx, align 4, !dbg !178
  %9 = load i32*, i32** %data, align 8, !dbg !179
  %10 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !179
  store i32 %8, i32* %arrayidx1, align 4, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %11, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !187
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !187
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !187
  call void @printIntLine(i32 %13), !dbg !188
  ret void, !dbg !189
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_08.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_08_bad", scope: !14, file: !14, line: 35, type: !15, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_08.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 37, type: !4)
!18 = !DILocation(line: 37, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 38, type: !4)
!20 = !DILocation(line: 38, column: 11, scope: !13)
!21 = !DILocation(line: 38, column: 34, scope: !13)
!22 = !DILocation(line: 38, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 39, type: !4)
!24 = !DILocation(line: 39, column: 11, scope: !13)
!25 = !DILocation(line: 39, column: 35, scope: !13)
!26 = !DILocation(line: 39, column: 28, scope: !13)
!27 = !DILocation(line: 40, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 8)
!29 = !DILocation(line: 40, column: 8, scope: !13)
!30 = !DILocation(line: 44, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !14, line: 41, column: 5)
!32 = !DILocation(line: 44, column: 14, scope: !31)
!33 = !DILocation(line: 45, column: 5, scope: !31)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 47, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 46, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 47, column: 13, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !41, file: !14, line: 49, type: !42)
!41 = distinct !DILexicalBlock(scope: !35, file: !14, line: 48, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 49, column: 20, scope: !41)
!46 = !DILocation(line: 51, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !14, line: 51, column: 13)
!48 = !DILocation(line: 51, column: 18, scope: !47)
!49 = !DILocation(line: 51, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !14, line: 51, column: 13)
!51 = !DILocation(line: 51, column: 27, scope: !50)
!52 = !DILocation(line: 51, column: 13, scope: !47)
!53 = !DILocation(line: 53, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !14, line: 52, column: 13)
!55 = !DILocation(line: 53, column: 27, scope: !54)
!56 = !DILocation(line: 53, column: 17, scope: !54)
!57 = !DILocation(line: 53, column: 22, scope: !54)
!58 = !DILocation(line: 53, column: 25, scope: !54)
!59 = !DILocation(line: 54, column: 13, scope: !54)
!60 = !DILocation(line: 51, column: 35, scope: !50)
!61 = !DILocation(line: 51, column: 13, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 54, column: 13, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 55, column: 26, scope: !41)
!66 = !DILocation(line: 55, column: 13, scope: !41)
!67 = !DILocation(line: 58, column: 1, scope: !13)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_08_good", scope: !14, file: !14, line: 119, type: !15, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 121, column: 5, scope: !68)
!70 = !DILocation(line: 122, column: 5, scope: !68)
!71 = !DILocation(line: 123, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 135, type: !73, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!5, !5, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !14, line: 135, type: !5)
!79 = !DILocation(line: 135, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !14, line: 135, type: !75)
!81 = !DILocation(line: 135, column: 27, scope: !72)
!82 = !DILocation(line: 138, column: 22, scope: !72)
!83 = !DILocation(line: 138, column: 12, scope: !72)
!84 = !DILocation(line: 138, column: 5, scope: !72)
!85 = !DILocation(line: 140, column: 5, scope: !72)
!86 = !DILocation(line: 141, column: 5, scope: !72)
!87 = !DILocation(line: 142, column: 5, scope: !72)
!88 = !DILocation(line: 145, column: 5, scope: !72)
!89 = !DILocation(line: 146, column: 5, scope: !72)
!90 = !DILocation(line: 147, column: 5, scope: !72)
!91 = !DILocation(line: 149, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 23, type: !93, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!5}
!95 = !DILocation(line: 25, column: 5, scope: !92)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 67, type: !4)
!98 = !DILocation(line: 67, column: 11, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !14, line: 68, type: !4)
!100 = !DILocation(line: 68, column: 11, scope: !96)
!101 = !DILocation(line: 68, column: 34, scope: !96)
!102 = !DILocation(line: 68, column: 27, scope: !96)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !14, line: 69, type: !4)
!104 = !DILocation(line: 69, column: 11, scope: !96)
!105 = !DILocation(line: 69, column: 35, scope: !96)
!106 = !DILocation(line: 69, column: 28, scope: !96)
!107 = !DILocation(line: 70, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !96, file: !14, line: 70, column: 8)
!109 = !DILocation(line: 70, column: 8, scope: !96)
!110 = !DILocation(line: 73, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !14, line: 71, column: 5)
!112 = !DILocation(line: 74, column: 5, scope: !111)
!113 = !DILocation(line: 78, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !14, line: 76, column: 5)
!115 = !DILocation(line: 78, column: 14, scope: !114)
!116 = !DILocalVariable(name: "source", scope: !117, file: !14, line: 81, type: !36)
!117 = distinct !DILexicalBlock(scope: !96, file: !14, line: 80, column: 5)
!118 = !DILocation(line: 81, column: 13, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !14, line: 83, type: !42)
!120 = distinct !DILexicalBlock(scope: !117, file: !14, line: 82, column: 9)
!121 = !DILocation(line: 83, column: 20, scope: !120)
!122 = !DILocation(line: 85, column: 20, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !14, line: 85, column: 13)
!124 = !DILocation(line: 85, column: 18, scope: !123)
!125 = !DILocation(line: 85, column: 25, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !14, line: 85, column: 13)
!127 = !DILocation(line: 85, column: 27, scope: !126)
!128 = !DILocation(line: 85, column: 13, scope: !123)
!129 = !DILocation(line: 87, column: 34, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !14, line: 86, column: 13)
!131 = !DILocation(line: 87, column: 27, scope: !130)
!132 = !DILocation(line: 87, column: 17, scope: !130)
!133 = !DILocation(line: 87, column: 22, scope: !130)
!134 = !DILocation(line: 87, column: 25, scope: !130)
!135 = !DILocation(line: 88, column: 13, scope: !130)
!136 = !DILocation(line: 85, column: 35, scope: !126)
!137 = !DILocation(line: 85, column: 13, scope: !126)
!138 = distinct !{!138, !128, !139, !64}
!139 = !DILocation(line: 88, column: 13, scope: !123)
!140 = !DILocation(line: 89, column: 26, scope: !120)
!141 = !DILocation(line: 89, column: 13, scope: !120)
!142 = !DILocation(line: 92, column: 1, scope: !96)
!143 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 28, type: !93, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocation(line: 30, column: 5, scope: !143)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 95, type: !15, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !14, line: 97, type: !4)
!147 = !DILocation(line: 97, column: 11, scope: !145)
!148 = !DILocalVariable(name: "dataBadBuffer", scope: !145, file: !14, line: 98, type: !4)
!149 = !DILocation(line: 98, column: 11, scope: !145)
!150 = !DILocation(line: 98, column: 34, scope: !145)
!151 = !DILocation(line: 98, column: 27, scope: !145)
!152 = !DILocalVariable(name: "dataGoodBuffer", scope: !145, file: !14, line: 99, type: !4)
!153 = !DILocation(line: 99, column: 11, scope: !145)
!154 = !DILocation(line: 99, column: 35, scope: !145)
!155 = !DILocation(line: 99, column: 28, scope: !145)
!156 = !DILocation(line: 100, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !145, file: !14, line: 100, column: 8)
!158 = !DILocation(line: 100, column: 8, scope: !145)
!159 = !DILocation(line: 103, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !14, line: 101, column: 5)
!161 = !DILocation(line: 103, column: 14, scope: !160)
!162 = !DILocation(line: 104, column: 5, scope: !160)
!163 = !DILocalVariable(name: "source", scope: !164, file: !14, line: 106, type: !36)
!164 = distinct !DILexicalBlock(scope: !145, file: !14, line: 105, column: 5)
!165 = !DILocation(line: 106, column: 13, scope: !164)
!166 = !DILocalVariable(name: "i", scope: !167, file: !14, line: 108, type: !42)
!167 = distinct !DILexicalBlock(scope: !164, file: !14, line: 107, column: 9)
!168 = !DILocation(line: 108, column: 20, scope: !167)
!169 = !DILocation(line: 110, column: 20, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !14, line: 110, column: 13)
!171 = !DILocation(line: 110, column: 18, scope: !170)
!172 = !DILocation(line: 110, column: 25, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !14, line: 110, column: 13)
!174 = !DILocation(line: 110, column: 27, scope: !173)
!175 = !DILocation(line: 110, column: 13, scope: !170)
!176 = !DILocation(line: 112, column: 34, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !14, line: 111, column: 13)
!178 = !DILocation(line: 112, column: 27, scope: !177)
!179 = !DILocation(line: 112, column: 17, scope: !177)
!180 = !DILocation(line: 112, column: 22, scope: !177)
!181 = !DILocation(line: 112, column: 25, scope: !177)
!182 = !DILocation(line: 113, column: 13, scope: !177)
!183 = !DILocation(line: 110, column: 35, scope: !173)
!184 = !DILocation(line: 110, column: 13, scope: !173)
!185 = distinct !{!185, !175, !186, !64}
!186 = !DILocation(line: 113, column: 13, scope: !170)
!187 = !DILocation(line: 114, column: 26, scope: !167)
!188 = !DILocation(line: 114, column: 13, scope: !167)
!189 = !DILocation(line: 117, column: 1, scope: !145)
