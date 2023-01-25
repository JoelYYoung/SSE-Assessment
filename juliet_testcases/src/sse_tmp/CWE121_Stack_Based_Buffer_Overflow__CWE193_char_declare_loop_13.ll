; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !49
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !50
  store i64 %call, i64* %sourceLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !55
  %4 = load i64, i64* %sourceLen, align 8, !dbg !57
  %add = add i64 %4, 1, !dbg !58
  %cmp2 = icmp ult i64 %3, %add, !dbg !59
  br i1 %cmp2, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !63
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !63
  %7 = load i8*, i8** %data, align 8, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !64
  store i8 %6, i8* %arrayidx4, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %9, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !73
  call void @printLine(i8* %10), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !106
  %cmp = icmp ne i32 %0, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i8* %arraydecay, i8** %data, align 8, !dbg !115
  %1 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !125
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !126
  store i64 %call, i64* %sourceLen, align 8, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !131
  %4 = load i64, i64* %sourceLen, align 8, !dbg !133
  %add = add i64 %4, 1, !dbg !134
  %cmp2 = icmp ult i64 %3, %add, !dbg !135
  br i1 %cmp2, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !139
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !139
  %7 = load i8*, i8** %data, align 8, !dbg !140
  %8 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !140
  store i8 %6, i8* %arrayidx4, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %9, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !148
  call void @printLine(i8* %10), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !158
  %cmp = icmp eq i32 %0, 5, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !162
  store i8* %arraydecay, i8** %data, align 8, !dbg !164
  %1 = load i8*, i8** %data, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !168, metadata !DIExpression()), !dbg !170
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !170
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !173, metadata !DIExpression()), !dbg !174
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !175
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !176
  store i64 %call, i64* %sourceLen, align 8, !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !181
  %4 = load i64, i64* %sourceLen, align 8, !dbg !183
  %add = add i64 %4, 1, !dbg !184
  %cmp2 = icmp ult i64 %3, %add, !dbg !185
  br i1 %cmp2, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !189
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !189
  %7 = load i8*, i8** %data, align 8, !dbg !190
  %8 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !190
  store i8 %6, i8* %arrayidx4, align 1, !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !194
  %inc = add i64 %9, 1, !dbg !194
  store i64 %inc, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !198
  call void @printLine(i8* %10), !dbg !199
  ret void, !dbg !200
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 25, scope: !30)
!32 = !DILocation(line: 33, column: 8, scope: !11)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 34, column: 5)
!35 = !DILocation(line: 37, column: 14, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 17, scope: !34)
!38 = !DILocation(line: 39, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 41, type: !25)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!41 = !DILocation(line: 41, column: 14, scope: !40)
!42 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 42, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 42, column: 16, scope: !40)
!47 = !DILocalVariable(name: "sourceLen", scope: !40, file: !12, line: 42, type: !43)
!48 = !DILocation(line: 42, column: 19, scope: !40)
!49 = !DILocation(line: 43, column: 28, scope: !40)
!50 = !DILocation(line: 43, column: 21, scope: !40)
!51 = !DILocation(line: 43, column: 19, scope: !40)
!52 = !DILocation(line: 46, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !40, file: !12, line: 46, column: 9)
!54 = !DILocation(line: 46, column: 14, scope: !53)
!55 = !DILocation(line: 46, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 46, column: 9)
!57 = !DILocation(line: 46, column: 25, scope: !56)
!58 = !DILocation(line: 46, column: 35, scope: !56)
!59 = !DILocation(line: 46, column: 23, scope: !56)
!60 = !DILocation(line: 46, column: 9, scope: !53)
!61 = !DILocation(line: 48, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !12, line: 47, column: 9)
!63 = !DILocation(line: 48, column: 23, scope: !62)
!64 = !DILocation(line: 48, column: 13, scope: !62)
!65 = !DILocation(line: 48, column: 18, scope: !62)
!66 = !DILocation(line: 48, column: 21, scope: !62)
!67 = !DILocation(line: 49, column: 9, scope: !62)
!68 = !DILocation(line: 46, column: 41, scope: !56)
!69 = !DILocation(line: 46, column: 9, scope: !56)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 49, column: 9, scope: !53)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 50, column: 19, scope: !40)
!74 = !DILocation(line: 50, column: 9, scope: !40)
!75 = !DILocation(line: 52, column: 1, scope: !11)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_13_good", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 119, column: 5, scope: !76)
!78 = !DILocation(line: 120, column: 5, scope: !76)
!79 = !DILocation(line: 121, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !81, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 133, type: !83)
!86 = !DILocation(line: 133, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 133, type: !84)
!88 = !DILocation(line: 133, column: 27, scope: !80)
!89 = !DILocation(line: 136, column: 22, scope: !80)
!90 = !DILocation(line: 136, column: 12, scope: !80)
!91 = !DILocation(line: 136, column: 5, scope: !80)
!92 = !DILocation(line: 138, column: 5, scope: !80)
!93 = !DILocation(line: 139, column: 5, scope: !80)
!94 = !DILocation(line: 140, column: 5, scope: !80)
!95 = !DILocation(line: 143, column: 5, scope: !80)
!96 = !DILocation(line: 144, column: 5, scope: !80)
!97 = !DILocation(line: 145, column: 5, scope: !80)
!98 = !DILocation(line: 147, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 61, type: !16)
!101 = !DILocation(line: 61, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 62, type: !20)
!103 = !DILocation(line: 62, column: 10, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 63, type: !25)
!105 = !DILocation(line: 63, column: 10, scope: !99)
!106 = !DILocation(line: 64, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !12, line: 64, column: 8)
!108 = !DILocation(line: 64, column: 25, scope: !107)
!109 = !DILocation(line: 64, column: 8, scope: !99)
!110 = !DILocation(line: 67, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 65, column: 5)
!112 = !DILocation(line: 68, column: 5, scope: !111)
!113 = !DILocation(line: 73, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !12, line: 70, column: 5)
!115 = !DILocation(line: 73, column: 14, scope: !114)
!116 = !DILocation(line: 74, column: 9, scope: !114)
!117 = !DILocation(line: 74, column: 17, scope: !114)
!118 = !DILocalVariable(name: "source", scope: !119, file: !12, line: 77, type: !25)
!119 = distinct !DILexicalBlock(scope: !99, file: !12, line: 76, column: 5)
!120 = !DILocation(line: 77, column: 14, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !119, file: !12, line: 78, type: !43)
!122 = !DILocation(line: 78, column: 16, scope: !119)
!123 = !DILocalVariable(name: "sourceLen", scope: !119, file: !12, line: 78, type: !43)
!124 = !DILocation(line: 78, column: 19, scope: !119)
!125 = !DILocation(line: 79, column: 28, scope: !119)
!126 = !DILocation(line: 79, column: 21, scope: !119)
!127 = !DILocation(line: 79, column: 19, scope: !119)
!128 = !DILocation(line: 82, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !119, file: !12, line: 82, column: 9)
!130 = !DILocation(line: 82, column: 14, scope: !129)
!131 = !DILocation(line: 82, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 82, column: 9)
!133 = !DILocation(line: 82, column: 25, scope: !132)
!134 = !DILocation(line: 82, column: 35, scope: !132)
!135 = !DILocation(line: 82, column: 23, scope: !132)
!136 = !DILocation(line: 82, column: 9, scope: !129)
!137 = !DILocation(line: 84, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !12, line: 83, column: 9)
!139 = !DILocation(line: 84, column: 23, scope: !138)
!140 = !DILocation(line: 84, column: 13, scope: !138)
!141 = !DILocation(line: 84, column: 18, scope: !138)
!142 = !DILocation(line: 84, column: 21, scope: !138)
!143 = !DILocation(line: 85, column: 9, scope: !138)
!144 = !DILocation(line: 82, column: 41, scope: !132)
!145 = !DILocation(line: 82, column: 9, scope: !132)
!146 = distinct !{!146, !136, !147, !72}
!147 = !DILocation(line: 85, column: 9, scope: !129)
!148 = !DILocation(line: 86, column: 19, scope: !119)
!149 = !DILocation(line: 86, column: 9, scope: !119)
!150 = !DILocation(line: 88, column: 1, scope: !99)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !12, line: 93, type: !16)
!153 = !DILocation(line: 93, column: 12, scope: !151)
!154 = !DILocalVariable(name: "dataBadBuffer", scope: !151, file: !12, line: 94, type: !20)
!155 = !DILocation(line: 94, column: 10, scope: !151)
!156 = !DILocalVariable(name: "dataGoodBuffer", scope: !151, file: !12, line: 95, type: !25)
!157 = !DILocation(line: 95, column: 10, scope: !151)
!158 = !DILocation(line: 96, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !151, file: !12, line: 96, column: 8)
!160 = !DILocation(line: 96, column: 25, scope: !159)
!161 = !DILocation(line: 96, column: 8, scope: !151)
!162 = !DILocation(line: 100, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !12, line: 97, column: 5)
!164 = !DILocation(line: 100, column: 14, scope: !163)
!165 = !DILocation(line: 101, column: 9, scope: !163)
!166 = !DILocation(line: 101, column: 17, scope: !163)
!167 = !DILocation(line: 102, column: 5, scope: !163)
!168 = !DILocalVariable(name: "source", scope: !169, file: !12, line: 104, type: !25)
!169 = distinct !DILexicalBlock(scope: !151, file: !12, line: 103, column: 5)
!170 = !DILocation(line: 104, column: 14, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !169, file: !12, line: 105, type: !43)
!172 = !DILocation(line: 105, column: 16, scope: !169)
!173 = !DILocalVariable(name: "sourceLen", scope: !169, file: !12, line: 105, type: !43)
!174 = !DILocation(line: 105, column: 19, scope: !169)
!175 = !DILocation(line: 106, column: 28, scope: !169)
!176 = !DILocation(line: 106, column: 21, scope: !169)
!177 = !DILocation(line: 106, column: 19, scope: !169)
!178 = !DILocation(line: 109, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !169, file: !12, line: 109, column: 9)
!180 = !DILocation(line: 109, column: 14, scope: !179)
!181 = !DILocation(line: 109, column: 21, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !12, line: 109, column: 9)
!183 = !DILocation(line: 109, column: 25, scope: !182)
!184 = !DILocation(line: 109, column: 35, scope: !182)
!185 = !DILocation(line: 109, column: 23, scope: !182)
!186 = !DILocation(line: 109, column: 9, scope: !179)
!187 = !DILocation(line: 111, column: 30, scope: !188)
!188 = distinct !DILexicalBlock(scope: !182, file: !12, line: 110, column: 9)
!189 = !DILocation(line: 111, column: 23, scope: !188)
!190 = !DILocation(line: 111, column: 13, scope: !188)
!191 = !DILocation(line: 111, column: 18, scope: !188)
!192 = !DILocation(line: 111, column: 21, scope: !188)
!193 = !DILocation(line: 112, column: 9, scope: !188)
!194 = !DILocation(line: 109, column: 41, scope: !182)
!195 = !DILocation(line: 109, column: 9, scope: !182)
!196 = distinct !{!196, !186, !197, !72}
!197 = !DILocation(line: 112, column: 9, scope: !179)
!198 = !DILocation(line: 113, column: 19, scope: !169)
!199 = !DILocation(line: 113, column: 9, scope: !169)
!200 = !DILocation(line: 115, column: 1, scope: !151)
