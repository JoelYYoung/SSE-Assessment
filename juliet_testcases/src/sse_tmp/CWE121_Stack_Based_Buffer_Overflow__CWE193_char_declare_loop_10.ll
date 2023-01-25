; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10_bad() #0 !dbg !11 {
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
  %0 = load i32, i32* @globalTrue, align 4, !dbg !29
  %tobool = icmp ne i32 %0, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %1 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !49
  store i64 %call, i64* %sourceLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !54
  %4 = load i64, i64* %sourceLen, align 8, !dbg !56
  %add = add i64 %4, 1, !dbg !57
  %cmp = icmp ult i64 %3, %add, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !62
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !62
  %7 = load i8*, i8** %data, align 8, !dbg !63
  %8 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !63
  store i8 %6, i8* %arrayidx3, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %9, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %10), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = load i32, i32* @globalFalse, align 4, !dbg !105
  %tobool = icmp ne i32 %0, 0, !dbg !105
  br i1 %tobool, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  br label %if.end, !dbg !110

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !111
  store i8* %arraydecay, i8** %data, align 8, !dbg !113
  %1 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !123
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !124
  store i64 %call, i64* %sourceLen, align 8, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !129
  %4 = load i64, i64* %sourceLen, align 8, !dbg !131
  %add = add i64 %4, 1, !dbg !132
  %cmp = icmp ult i64 %3, %add, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !137
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !137
  %7 = load i8*, i8** %data, align 8, !dbg !138
  %8 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !138
  store i8 %6, i8* %arrayidx3, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %9, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !146
  call void @printLine(i8* %10), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = load i32, i32* @globalTrue, align 4, !dbg !156
  %tobool = icmp ne i32 %0, 0, !dbg !156
  br i1 %tobool, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !159
  store i8* %arraydecay, i8** %data, align 8, !dbg !161
  %1 = load i8*, i8** %data, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !162
  store i8 0, i8* %arrayidx, align 1, !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !165, metadata !DIExpression()), !dbg !167
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !167
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !167
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !170, metadata !DIExpression()), !dbg !171
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !172
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !173
  store i64 %call, i64* %sourceLen, align 8, !dbg !174
  store i64 0, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !178
  %4 = load i64, i64* %sourceLen, align 8, !dbg !180
  %add = add i64 %4, 1, !dbg !181
  %cmp = icmp ult i64 %3, %add, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !186
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !186
  %7 = load i8*, i8** %data, align 8, !dbg !187
  %8 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !187
  store i8 %6, i8* %arrayidx3, align 1, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %9, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !195
  call void @printLine(i8* %10), !dbg !196
  ret void, !dbg !197
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 33, column: 8, scope: !11)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 34, column: 5)
!34 = !DILocation(line: 37, column: 14, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 17, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 41, type: !25)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!40 = !DILocation(line: 41, column: 14, scope: !39)
!41 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 42, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 42, column: 16, scope: !39)
!46 = !DILocalVariable(name: "sourceLen", scope: !39, file: !12, line: 42, type: !42)
!47 = !DILocation(line: 42, column: 19, scope: !39)
!48 = !DILocation(line: 43, column: 28, scope: !39)
!49 = !DILocation(line: 43, column: 21, scope: !39)
!50 = !DILocation(line: 43, column: 19, scope: !39)
!51 = !DILocation(line: 46, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !39, file: !12, line: 46, column: 9)
!53 = !DILocation(line: 46, column: 14, scope: !52)
!54 = !DILocation(line: 46, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 46, column: 9)
!56 = !DILocation(line: 46, column: 25, scope: !55)
!57 = !DILocation(line: 46, column: 35, scope: !55)
!58 = !DILocation(line: 46, column: 23, scope: !55)
!59 = !DILocation(line: 46, column: 9, scope: !52)
!60 = !DILocation(line: 48, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !12, line: 47, column: 9)
!62 = !DILocation(line: 48, column: 23, scope: !61)
!63 = !DILocation(line: 48, column: 13, scope: !61)
!64 = !DILocation(line: 48, column: 18, scope: !61)
!65 = !DILocation(line: 48, column: 21, scope: !61)
!66 = !DILocation(line: 49, column: 9, scope: !61)
!67 = !DILocation(line: 46, column: 41, scope: !55)
!68 = !DILocation(line: 46, column: 9, scope: !55)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 49, column: 9, scope: !52)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 50, column: 19, scope: !39)
!73 = !DILocation(line: 50, column: 9, scope: !39)
!74 = !DILocation(line: 52, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_10_good", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 119, column: 5, scope: !75)
!77 = !DILocation(line: 120, column: 5, scope: !75)
!78 = !DILocation(line: 121, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !80, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 133, type: !82)
!85 = !DILocation(line: 133, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 133, type: !83)
!87 = !DILocation(line: 133, column: 27, scope: !79)
!88 = !DILocation(line: 136, column: 22, scope: !79)
!89 = !DILocation(line: 136, column: 12, scope: !79)
!90 = !DILocation(line: 136, column: 5, scope: !79)
!91 = !DILocation(line: 138, column: 5, scope: !79)
!92 = !DILocation(line: 139, column: 5, scope: !79)
!93 = !DILocation(line: 140, column: 5, scope: !79)
!94 = !DILocation(line: 143, column: 5, scope: !79)
!95 = !DILocation(line: 144, column: 5, scope: !79)
!96 = !DILocation(line: 145, column: 5, scope: !79)
!97 = !DILocation(line: 147, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 61, type: !16)
!100 = !DILocation(line: 61, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !12, line: 62, type: !20)
!102 = !DILocation(line: 62, column: 10, scope: !98)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !12, line: 63, type: !25)
!104 = !DILocation(line: 63, column: 10, scope: !98)
!105 = !DILocation(line: 64, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !12, line: 64, column: 8)
!107 = !DILocation(line: 64, column: 8, scope: !98)
!108 = !DILocation(line: 67, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 65, column: 5)
!110 = !DILocation(line: 68, column: 5, scope: !109)
!111 = !DILocation(line: 73, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !12, line: 70, column: 5)
!113 = !DILocation(line: 73, column: 14, scope: !112)
!114 = !DILocation(line: 74, column: 9, scope: !112)
!115 = !DILocation(line: 74, column: 17, scope: !112)
!116 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 77, type: !25)
!117 = distinct !DILexicalBlock(scope: !98, file: !12, line: 76, column: 5)
!118 = !DILocation(line: 77, column: 14, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !117, file: !12, line: 78, type: !42)
!120 = !DILocation(line: 78, column: 16, scope: !117)
!121 = !DILocalVariable(name: "sourceLen", scope: !117, file: !12, line: 78, type: !42)
!122 = !DILocation(line: 78, column: 19, scope: !117)
!123 = !DILocation(line: 79, column: 28, scope: !117)
!124 = !DILocation(line: 79, column: 21, scope: !117)
!125 = !DILocation(line: 79, column: 19, scope: !117)
!126 = !DILocation(line: 82, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !117, file: !12, line: 82, column: 9)
!128 = !DILocation(line: 82, column: 14, scope: !127)
!129 = !DILocation(line: 82, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 82, column: 9)
!131 = !DILocation(line: 82, column: 25, scope: !130)
!132 = !DILocation(line: 82, column: 35, scope: !130)
!133 = !DILocation(line: 82, column: 23, scope: !130)
!134 = !DILocation(line: 82, column: 9, scope: !127)
!135 = !DILocation(line: 84, column: 30, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !12, line: 83, column: 9)
!137 = !DILocation(line: 84, column: 23, scope: !136)
!138 = !DILocation(line: 84, column: 13, scope: !136)
!139 = !DILocation(line: 84, column: 18, scope: !136)
!140 = !DILocation(line: 84, column: 21, scope: !136)
!141 = !DILocation(line: 85, column: 9, scope: !136)
!142 = !DILocation(line: 82, column: 41, scope: !130)
!143 = !DILocation(line: 82, column: 9, scope: !130)
!144 = distinct !{!144, !134, !145, !71}
!145 = !DILocation(line: 85, column: 9, scope: !127)
!146 = !DILocation(line: 86, column: 19, scope: !117)
!147 = !DILocation(line: 86, column: 9, scope: !117)
!148 = !DILocation(line: 88, column: 1, scope: !98)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !12, line: 93, type: !16)
!151 = !DILocation(line: 93, column: 12, scope: !149)
!152 = !DILocalVariable(name: "dataBadBuffer", scope: !149, file: !12, line: 94, type: !20)
!153 = !DILocation(line: 94, column: 10, scope: !149)
!154 = !DILocalVariable(name: "dataGoodBuffer", scope: !149, file: !12, line: 95, type: !25)
!155 = !DILocation(line: 95, column: 10, scope: !149)
!156 = !DILocation(line: 96, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !149, file: !12, line: 96, column: 8)
!158 = !DILocation(line: 96, column: 8, scope: !149)
!159 = !DILocation(line: 100, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 97, column: 5)
!161 = !DILocation(line: 100, column: 14, scope: !160)
!162 = !DILocation(line: 101, column: 9, scope: !160)
!163 = !DILocation(line: 101, column: 17, scope: !160)
!164 = !DILocation(line: 102, column: 5, scope: !160)
!165 = !DILocalVariable(name: "source", scope: !166, file: !12, line: 104, type: !25)
!166 = distinct !DILexicalBlock(scope: !149, file: !12, line: 103, column: 5)
!167 = !DILocation(line: 104, column: 14, scope: !166)
!168 = !DILocalVariable(name: "i", scope: !166, file: !12, line: 105, type: !42)
!169 = !DILocation(line: 105, column: 16, scope: !166)
!170 = !DILocalVariable(name: "sourceLen", scope: !166, file: !12, line: 105, type: !42)
!171 = !DILocation(line: 105, column: 19, scope: !166)
!172 = !DILocation(line: 106, column: 28, scope: !166)
!173 = !DILocation(line: 106, column: 21, scope: !166)
!174 = !DILocation(line: 106, column: 19, scope: !166)
!175 = !DILocation(line: 109, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !166, file: !12, line: 109, column: 9)
!177 = !DILocation(line: 109, column: 14, scope: !176)
!178 = !DILocation(line: 109, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !12, line: 109, column: 9)
!180 = !DILocation(line: 109, column: 25, scope: !179)
!181 = !DILocation(line: 109, column: 35, scope: !179)
!182 = !DILocation(line: 109, column: 23, scope: !179)
!183 = !DILocation(line: 109, column: 9, scope: !176)
!184 = !DILocation(line: 111, column: 30, scope: !185)
!185 = distinct !DILexicalBlock(scope: !179, file: !12, line: 110, column: 9)
!186 = !DILocation(line: 111, column: 23, scope: !185)
!187 = !DILocation(line: 111, column: 13, scope: !185)
!188 = !DILocation(line: 111, column: 18, scope: !185)
!189 = !DILocation(line: 111, column: 21, scope: !185)
!190 = !DILocation(line: 112, column: 9, scope: !185)
!191 = !DILocation(line: 109, column: 41, scope: !179)
!192 = !DILocation(line: 109, column: 9, scope: !179)
!193 = distinct !{!193, !183, !194, !71}
!194 = !DILocation(line: 112, column: 9, scope: !176)
!195 = !DILocation(line: 113, column: 19, scope: !166)
!196 = !DILocation(line: 113, column: 9, scope: !166)
!197 = !DILocation(line: 115, column: 1, scope: !149)
