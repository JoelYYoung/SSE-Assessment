; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !44
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !45
  store i64 %call, i64* %sourceLen, align 8, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !50
  %6 = load i64, i64* %sourceLen, align 8, !dbg !52
  %add = add i64 %6, 1, !dbg !53
  %cmp = icmp ult i64 %5, %add, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !58
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !58
  %9 = load i8*, i8** %data, align 8, !dbg !59
  %10 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !59
  store i8 %8, i8* %arrayidx2, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %11, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* %12), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03_good() #0 !dbg !71 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 10, align 16, !dbg !99
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %1 = alloca i8, i64 11, align 16, !dbg !102
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !101
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !103
  store i8* %2, i8** %data, align 8, !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !116
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !117
  store i64 %call, i64* %sourceLen, align 8, !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !122
  %6 = load i64, i64* %sourceLen, align 8, !dbg !124
  %add = add i64 %6, 1, !dbg !125
  %cmp = icmp ult i64 %5, %add, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !130
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !130
  %9 = load i8*, i8** %data, align 8, !dbg !131
  %10 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !131
  store i8 %8, i8* %arrayidx2, align 1, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %11, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %12), !dbg !140
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = alloca i8, i64 10, align 16, !dbg !147
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %1 = alloca i8, i64 11, align 16, !dbg !150
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !149
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !151
  store i8* %2, i8** %data, align 8, !dbg !154
  %3 = load i8*, i8** %data, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !155
  store i8 0, i8* %arrayidx, align 1, !dbg !156
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !157, metadata !DIExpression()), !dbg !159
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !159
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !162, metadata !DIExpression()), !dbg !163
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !164
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !165
  store i64 %call, i64* %sourceLen, align 8, !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !170
  %6 = load i64, i64* %sourceLen, align 8, !dbg !172
  %add = add i64 %6, 1, !dbg !173
  %cmp = icmp ult i64 %5, %add, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !178
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !178
  %9 = load i8*, i8** %data, align 8, !dbg !179
  %10 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !179
  store i8 %8, i8* %arrayidx2, align 1, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %11, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !187
  call void @printLine(i8* %12), !dbg !188
  ret void, !dbg !189
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 37, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !14, line: 34, column: 5)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 8)
!28 = !DILocation(line: 37, column: 14, scope: !26)
!29 = !DILocation(line: 38, column: 9, scope: !26)
!30 = !DILocation(line: 38, column: 17, scope: !26)
!31 = !DILocalVariable(name: "source", scope: !32, file: !14, line: 41, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 11)
!36 = !DILocation(line: 41, column: 14, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !14, line: 42, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 42, column: 16, scope: !32)
!42 = !DILocalVariable(name: "sourceLen", scope: !32, file: !14, line: 42, type: !38)
!43 = !DILocation(line: 42, column: 19, scope: !32)
!44 = !DILocation(line: 43, column: 28, scope: !32)
!45 = !DILocation(line: 43, column: 21, scope: !32)
!46 = !DILocation(line: 43, column: 19, scope: !32)
!47 = !DILocation(line: 46, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !32, file: !14, line: 46, column: 9)
!49 = !DILocation(line: 46, column: 14, scope: !48)
!50 = !DILocation(line: 46, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !14, line: 46, column: 9)
!52 = !DILocation(line: 46, column: 25, scope: !51)
!53 = !DILocation(line: 46, column: 35, scope: !51)
!54 = !DILocation(line: 46, column: 23, scope: !51)
!55 = !DILocation(line: 46, column: 9, scope: !48)
!56 = !DILocation(line: 48, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !14, line: 47, column: 9)
!58 = !DILocation(line: 48, column: 23, scope: !57)
!59 = !DILocation(line: 48, column: 13, scope: !57)
!60 = !DILocation(line: 48, column: 18, scope: !57)
!61 = !DILocation(line: 48, column: 21, scope: !57)
!62 = !DILocation(line: 49, column: 9, scope: !57)
!63 = !DILocation(line: 46, column: 41, scope: !51)
!64 = !DILocation(line: 46, column: 9, scope: !51)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 49, column: 9, scope: !48)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 50, column: 19, scope: !32)
!69 = !DILocation(line: 50, column: 9, scope: !32)
!70 = !DILocation(line: 52, column: 1, scope: !13)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_03_good", scope: !14, file: !14, line: 117, type: !15, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 119, column: 5, scope: !71)
!73 = !DILocation(line: 120, column: 5, scope: !71)
!74 = !DILocation(line: 121, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 133, type: !76, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !14, line: 133, type: !78)
!81 = !DILocation(line: 133, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !14, line: 133, type: !79)
!83 = !DILocation(line: 133, column: 27, scope: !75)
!84 = !DILocation(line: 136, column: 22, scope: !75)
!85 = !DILocation(line: 136, column: 12, scope: !75)
!86 = !DILocation(line: 136, column: 5, scope: !75)
!87 = !DILocation(line: 138, column: 5, scope: !75)
!88 = !DILocation(line: 139, column: 5, scope: !75)
!89 = !DILocation(line: 140, column: 5, scope: !75)
!90 = !DILocation(line: 143, column: 5, scope: !75)
!91 = !DILocation(line: 144, column: 5, scope: !75)
!92 = !DILocation(line: 145, column: 5, scope: !75)
!93 = !DILocation(line: 147, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !14, line: 61, type: !4)
!96 = !DILocation(line: 61, column: 12, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !14, line: 62, type: !4)
!98 = !DILocation(line: 62, column: 12, scope: !94)
!99 = !DILocation(line: 62, column: 36, scope: !94)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !14, line: 63, type: !4)
!101 = !DILocation(line: 63, column: 12, scope: !94)
!102 = !DILocation(line: 63, column: 37, scope: !94)
!103 = !DILocation(line: 73, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !14, line: 70, column: 5)
!105 = distinct !DILexicalBlock(scope: !94, file: !14, line: 64, column: 8)
!106 = !DILocation(line: 73, column: 14, scope: !104)
!107 = !DILocation(line: 74, column: 9, scope: !104)
!108 = !DILocation(line: 74, column: 17, scope: !104)
!109 = !DILocalVariable(name: "source", scope: !110, file: !14, line: 77, type: !33)
!110 = distinct !DILexicalBlock(scope: !94, file: !14, line: 76, column: 5)
!111 = !DILocation(line: 77, column: 14, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !110, file: !14, line: 78, type: !38)
!113 = !DILocation(line: 78, column: 16, scope: !110)
!114 = !DILocalVariable(name: "sourceLen", scope: !110, file: !14, line: 78, type: !38)
!115 = !DILocation(line: 78, column: 19, scope: !110)
!116 = !DILocation(line: 79, column: 28, scope: !110)
!117 = !DILocation(line: 79, column: 21, scope: !110)
!118 = !DILocation(line: 79, column: 19, scope: !110)
!119 = !DILocation(line: 82, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !14, line: 82, column: 9)
!121 = !DILocation(line: 82, column: 14, scope: !120)
!122 = !DILocation(line: 82, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !14, line: 82, column: 9)
!124 = !DILocation(line: 82, column: 25, scope: !123)
!125 = !DILocation(line: 82, column: 35, scope: !123)
!126 = !DILocation(line: 82, column: 23, scope: !123)
!127 = !DILocation(line: 82, column: 9, scope: !120)
!128 = !DILocation(line: 84, column: 30, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !14, line: 83, column: 9)
!130 = !DILocation(line: 84, column: 23, scope: !129)
!131 = !DILocation(line: 84, column: 13, scope: !129)
!132 = !DILocation(line: 84, column: 18, scope: !129)
!133 = !DILocation(line: 84, column: 21, scope: !129)
!134 = !DILocation(line: 85, column: 9, scope: !129)
!135 = !DILocation(line: 82, column: 41, scope: !123)
!136 = !DILocation(line: 82, column: 9, scope: !123)
!137 = distinct !{!137, !127, !138, !67}
!138 = !DILocation(line: 85, column: 9, scope: !120)
!139 = !DILocation(line: 86, column: 19, scope: !110)
!140 = !DILocation(line: 86, column: 9, scope: !110)
!141 = !DILocation(line: 88, column: 1, scope: !94)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !14, line: 93, type: !4)
!144 = !DILocation(line: 93, column: 12, scope: !142)
!145 = !DILocalVariable(name: "dataBadBuffer", scope: !142, file: !14, line: 94, type: !4)
!146 = !DILocation(line: 94, column: 12, scope: !142)
!147 = !DILocation(line: 94, column: 36, scope: !142)
!148 = !DILocalVariable(name: "dataGoodBuffer", scope: !142, file: !14, line: 95, type: !4)
!149 = !DILocation(line: 95, column: 12, scope: !142)
!150 = !DILocation(line: 95, column: 37, scope: !142)
!151 = !DILocation(line: 100, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !153, file: !14, line: 97, column: 5)
!153 = distinct !DILexicalBlock(scope: !142, file: !14, line: 96, column: 8)
!154 = !DILocation(line: 100, column: 14, scope: !152)
!155 = !DILocation(line: 101, column: 9, scope: !152)
!156 = !DILocation(line: 101, column: 17, scope: !152)
!157 = !DILocalVariable(name: "source", scope: !158, file: !14, line: 104, type: !33)
!158 = distinct !DILexicalBlock(scope: !142, file: !14, line: 103, column: 5)
!159 = !DILocation(line: 104, column: 14, scope: !158)
!160 = !DILocalVariable(name: "i", scope: !158, file: !14, line: 105, type: !38)
!161 = !DILocation(line: 105, column: 16, scope: !158)
!162 = !DILocalVariable(name: "sourceLen", scope: !158, file: !14, line: 105, type: !38)
!163 = !DILocation(line: 105, column: 19, scope: !158)
!164 = !DILocation(line: 106, column: 28, scope: !158)
!165 = !DILocation(line: 106, column: 21, scope: !158)
!166 = !DILocation(line: 106, column: 19, scope: !158)
!167 = !DILocation(line: 109, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !158, file: !14, line: 109, column: 9)
!169 = !DILocation(line: 109, column: 14, scope: !168)
!170 = !DILocation(line: 109, column: 21, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !14, line: 109, column: 9)
!172 = !DILocation(line: 109, column: 25, scope: !171)
!173 = !DILocation(line: 109, column: 35, scope: !171)
!174 = !DILocation(line: 109, column: 23, scope: !171)
!175 = !DILocation(line: 109, column: 9, scope: !168)
!176 = !DILocation(line: 111, column: 30, scope: !177)
!177 = distinct !DILexicalBlock(scope: !171, file: !14, line: 110, column: 9)
!178 = !DILocation(line: 111, column: 23, scope: !177)
!179 = !DILocation(line: 111, column: 13, scope: !177)
!180 = !DILocation(line: 111, column: 18, scope: !177)
!181 = !DILocation(line: 111, column: 21, scope: !177)
!182 = !DILocation(line: 112, column: 9, scope: !177)
!183 = !DILocation(line: 109, column: 41, scope: !171)
!184 = !DILocation(line: 109, column: 9, scope: !171)
!185 = distinct !{!185, !175, !186, !67}
!186 = !DILocation(line: 112, column: 9, scope: !168)
!187 = !DILocation(line: 113, column: 19, scope: !158)
!188 = !DILocation(line: 113, column: 9, scope: !158)
!189 = !DILocation(line: 115, column: 1, scope: !142)
