; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i8* %arraydecay, i8** %data, align 8, !dbg !39
  %1 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !54
  store i64 %call, i64* %sourceLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !59
  %4 = load i64, i64* %sourceLen, align 8, !dbg !61
  %add = add i64 %4, 1, !dbg !62
  %cmp2 = icmp ult i64 %3, %add, !dbg !63
  br i1 %cmp2, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !67
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !67
  %7 = load i8*, i8** %data, align 8, !dbg !68
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !68
  store i8 %6, i8* %arrayidx4, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %9, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !77
  call void @printLine(i8* %10), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = load i32, i32* @staticFive, align 4, !dbg !109
  %cmp = icmp ne i32 %0, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  store i8* %arraydecay, i8** %data, align 8, !dbg !118
  %1 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !128
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !129
  store i64 %call, i64* %sourceLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !134
  %4 = load i64, i64* %sourceLen, align 8, !dbg !136
  %add = add i64 %4, 1, !dbg !137
  %cmp2 = icmp ult i64 %3, %add, !dbg !138
  br i1 %cmp2, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !142
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !142
  %7 = load i8*, i8** %data, align 8, !dbg !143
  %8 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !143
  store i8 %6, i8* %arrayidx4, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %9, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !151
  call void @printLine(i8* %10), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = load i32, i32* @staticFive, align 4, !dbg !161
  %cmp = icmp eq i32 %0, 5, !dbg !163
  br i1 %cmp, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !165
  store i8* %arraydecay, i8** %data, align 8, !dbg !167
  %1 = load i8*, i8** %data, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  br label %if.end, !dbg !170

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !171, metadata !DIExpression()), !dbg !173
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !173
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !173
  call void @llvm.dbg.declare(metadata i64* %i, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !176, metadata !DIExpression()), !dbg !177
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !178
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !179
  store i64 %call, i64* %sourceLen, align 8, !dbg !180
  store i64 0, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !184
  %4 = load i64, i64* %sourceLen, align 8, !dbg !186
  %add = add i64 %4, 1, !dbg !187
  %cmp2 = icmp ult i64 %3, %add, !dbg !188
  br i1 %cmp2, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !192
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !192
  %7 = load i8*, i8** %data, align 8, !dbg !193
  %8 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !193
  store i8 %6, i8* %arrayidx4, align 1, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %9, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !201
  call void @printLine(i8* %10), !dbg !202
  ret void, !dbg !203
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_bad", scope: !8, file: !8, line: 34, type: !17, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 36, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 36, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 37, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 80, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 37, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 38, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 88, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 11)
!32 = !DILocation(line: 38, column: 10, scope: !16)
!33 = !DILocation(line: 39, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !8, line: 39, column: 8)
!35 = !DILocation(line: 39, column: 18, scope: !34)
!36 = !DILocation(line: 39, column: 8, scope: !16)
!37 = !DILocation(line: 43, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !8, line: 40, column: 5)
!39 = !DILocation(line: 43, column: 14, scope: !38)
!40 = !DILocation(line: 44, column: 9, scope: !38)
!41 = !DILocation(line: 44, column: 17, scope: !38)
!42 = !DILocation(line: 45, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !8, line: 47, type: !29)
!44 = distinct !DILexicalBlock(scope: !16, file: !8, line: 46, column: 5)
!45 = !DILocation(line: 47, column: 14, scope: !44)
!46 = !DILocalVariable(name: "i", scope: !44, file: !8, line: 48, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 48, column: 16, scope: !44)
!51 = !DILocalVariable(name: "sourceLen", scope: !44, file: !8, line: 48, type: !47)
!52 = !DILocation(line: 48, column: 19, scope: !44)
!53 = !DILocation(line: 49, column: 28, scope: !44)
!54 = !DILocation(line: 49, column: 21, scope: !44)
!55 = !DILocation(line: 49, column: 19, scope: !44)
!56 = !DILocation(line: 52, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !44, file: !8, line: 52, column: 9)
!58 = !DILocation(line: 52, column: 14, scope: !57)
!59 = !DILocation(line: 52, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !8, line: 52, column: 9)
!61 = !DILocation(line: 52, column: 25, scope: !60)
!62 = !DILocation(line: 52, column: 35, scope: !60)
!63 = !DILocation(line: 52, column: 23, scope: !60)
!64 = !DILocation(line: 52, column: 9, scope: !57)
!65 = !DILocation(line: 54, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !8, line: 53, column: 9)
!67 = !DILocation(line: 54, column: 23, scope: !66)
!68 = !DILocation(line: 54, column: 13, scope: !66)
!69 = !DILocation(line: 54, column: 18, scope: !66)
!70 = !DILocation(line: 54, column: 21, scope: !66)
!71 = !DILocation(line: 55, column: 9, scope: !66)
!72 = !DILocation(line: 52, column: 41, scope: !60)
!73 = !DILocation(line: 52, column: 9, scope: !60)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 55, column: 9, scope: !57)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 56, column: 19, scope: !44)
!78 = !DILocation(line: 56, column: 9, scope: !44)
!79 = !DILocation(line: 58, column: 1, scope: !16)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_good", scope: !8, file: !8, line: 123, type: !17, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 125, column: 5, scope: !80)
!82 = !DILocation(line: 126, column: 5, scope: !80)
!83 = !DILocation(line: 127, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 139, type: !85, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!9, !9, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !8, line: 139, type: !9)
!89 = !DILocation(line: 139, column: 14, scope: !84)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !8, line: 139, type: !87)
!91 = !DILocation(line: 139, column: 27, scope: !84)
!92 = !DILocation(line: 142, column: 22, scope: !84)
!93 = !DILocation(line: 142, column: 12, scope: !84)
!94 = !DILocation(line: 142, column: 5, scope: !84)
!95 = !DILocation(line: 144, column: 5, scope: !84)
!96 = !DILocation(line: 145, column: 5, scope: !84)
!97 = !DILocation(line: 146, column: 5, scope: !84)
!98 = !DILocation(line: 149, column: 5, scope: !84)
!99 = !DILocation(line: 150, column: 5, scope: !84)
!100 = !DILocation(line: 151, column: 5, scope: !84)
!101 = !DILocation(line: 153, column: 5, scope: !84)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !8, line: 67, type: !20)
!104 = !DILocation(line: 67, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !8, line: 68, type: !24)
!106 = !DILocation(line: 68, column: 10, scope: !102)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !8, line: 69, type: !29)
!108 = !DILocation(line: 69, column: 10, scope: !102)
!109 = !DILocation(line: 70, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !8, line: 70, column: 8)
!111 = !DILocation(line: 70, column: 18, scope: !110)
!112 = !DILocation(line: 70, column: 8, scope: !102)
!113 = !DILocation(line: 73, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !8, line: 71, column: 5)
!115 = !DILocation(line: 74, column: 5, scope: !114)
!116 = !DILocation(line: 79, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !8, line: 76, column: 5)
!118 = !DILocation(line: 79, column: 14, scope: !117)
!119 = !DILocation(line: 80, column: 9, scope: !117)
!120 = !DILocation(line: 80, column: 17, scope: !117)
!121 = !DILocalVariable(name: "source", scope: !122, file: !8, line: 83, type: !29)
!122 = distinct !DILexicalBlock(scope: !102, file: !8, line: 82, column: 5)
!123 = !DILocation(line: 83, column: 14, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !8, line: 84, type: !47)
!125 = !DILocation(line: 84, column: 16, scope: !122)
!126 = !DILocalVariable(name: "sourceLen", scope: !122, file: !8, line: 84, type: !47)
!127 = !DILocation(line: 84, column: 19, scope: !122)
!128 = !DILocation(line: 85, column: 28, scope: !122)
!129 = !DILocation(line: 85, column: 21, scope: !122)
!130 = !DILocation(line: 85, column: 19, scope: !122)
!131 = !DILocation(line: 88, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !8, line: 88, column: 9)
!133 = !DILocation(line: 88, column: 14, scope: !132)
!134 = !DILocation(line: 88, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !8, line: 88, column: 9)
!136 = !DILocation(line: 88, column: 25, scope: !135)
!137 = !DILocation(line: 88, column: 35, scope: !135)
!138 = !DILocation(line: 88, column: 23, scope: !135)
!139 = !DILocation(line: 88, column: 9, scope: !132)
!140 = !DILocation(line: 90, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !8, line: 89, column: 9)
!142 = !DILocation(line: 90, column: 23, scope: !141)
!143 = !DILocation(line: 90, column: 13, scope: !141)
!144 = !DILocation(line: 90, column: 18, scope: !141)
!145 = !DILocation(line: 90, column: 21, scope: !141)
!146 = !DILocation(line: 91, column: 9, scope: !141)
!147 = !DILocation(line: 88, column: 41, scope: !135)
!148 = !DILocation(line: 88, column: 9, scope: !135)
!149 = distinct !{!149, !139, !150, !76}
!150 = !DILocation(line: 91, column: 9, scope: !132)
!151 = !DILocation(line: 92, column: 19, scope: !122)
!152 = !DILocation(line: 92, column: 9, scope: !122)
!153 = !DILocation(line: 94, column: 1, scope: !102)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 97, type: !17, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocalVariable(name: "data", scope: !154, file: !8, line: 99, type: !20)
!156 = !DILocation(line: 99, column: 12, scope: !154)
!157 = !DILocalVariable(name: "dataBadBuffer", scope: !154, file: !8, line: 100, type: !24)
!158 = !DILocation(line: 100, column: 10, scope: !154)
!159 = !DILocalVariable(name: "dataGoodBuffer", scope: !154, file: !8, line: 101, type: !29)
!160 = !DILocation(line: 101, column: 10, scope: !154)
!161 = !DILocation(line: 102, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !154, file: !8, line: 102, column: 8)
!163 = !DILocation(line: 102, column: 18, scope: !162)
!164 = !DILocation(line: 102, column: 8, scope: !154)
!165 = !DILocation(line: 106, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !8, line: 103, column: 5)
!167 = !DILocation(line: 106, column: 14, scope: !166)
!168 = !DILocation(line: 107, column: 9, scope: !166)
!169 = !DILocation(line: 107, column: 17, scope: !166)
!170 = !DILocation(line: 108, column: 5, scope: !166)
!171 = !DILocalVariable(name: "source", scope: !172, file: !8, line: 110, type: !29)
!172 = distinct !DILexicalBlock(scope: !154, file: !8, line: 109, column: 5)
!173 = !DILocation(line: 110, column: 14, scope: !172)
!174 = !DILocalVariable(name: "i", scope: !172, file: !8, line: 111, type: !47)
!175 = !DILocation(line: 111, column: 16, scope: !172)
!176 = !DILocalVariable(name: "sourceLen", scope: !172, file: !8, line: 111, type: !47)
!177 = !DILocation(line: 111, column: 19, scope: !172)
!178 = !DILocation(line: 112, column: 28, scope: !172)
!179 = !DILocation(line: 112, column: 21, scope: !172)
!180 = !DILocation(line: 112, column: 19, scope: !172)
!181 = !DILocation(line: 115, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !172, file: !8, line: 115, column: 9)
!183 = !DILocation(line: 115, column: 14, scope: !182)
!184 = !DILocation(line: 115, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !8, line: 115, column: 9)
!186 = !DILocation(line: 115, column: 25, scope: !185)
!187 = !DILocation(line: 115, column: 35, scope: !185)
!188 = !DILocation(line: 115, column: 23, scope: !185)
!189 = !DILocation(line: 115, column: 9, scope: !182)
!190 = !DILocation(line: 117, column: 30, scope: !191)
!191 = distinct !DILexicalBlock(scope: !185, file: !8, line: 116, column: 9)
!192 = !DILocation(line: 117, column: 23, scope: !191)
!193 = !DILocation(line: 117, column: 13, scope: !191)
!194 = !DILocation(line: 117, column: 18, scope: !191)
!195 = !DILocation(line: 117, column: 21, scope: !191)
!196 = !DILocation(line: 118, column: 9, scope: !191)
!197 = !DILocation(line: 115, column: 41, scope: !185)
!198 = !DILocation(line: 115, column: 9, scope: !185)
!199 = distinct !{!199, !189, !200, !76}
!200 = !DILocation(line: 118, column: 9, scope: !182)
!201 = !DILocation(line: 119, column: 19, scope: !172)
!202 = !DILocation(line: 119, column: 9, scope: !172)
!203 = !DILocation(line: 121, column: 1, scope: !154)
