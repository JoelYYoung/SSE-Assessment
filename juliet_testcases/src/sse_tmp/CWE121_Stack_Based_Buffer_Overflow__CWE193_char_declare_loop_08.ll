; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08_bad() #0 !dbg !11 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !49
  store i64 %call2, i64* %sourceLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !54
  %3 = load i64, i64* %sourceLen, align 8, !dbg !56
  %add = add i64 %3, 1, !dbg !57
  %cmp = icmp ult i64 %2, %add, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !62
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !62
  %6 = load i8*, i8** %data, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !63
  store i8 %5, i8* %arrayidx4, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %8, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %9), !dbg !73
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08_good() #0 !dbg !75 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !98 {
entry:
  ret i32 1, !dbg !101
}

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
  %call = call i32 @staticReturnsFalse(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !115
  store i8* %arraydecay, i8** %data, align 8, !dbg !117
  %0 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !127
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !128
  store i64 %call2, i64* %sourceLen, align 8, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !133
  %3 = load i64, i64* %sourceLen, align 8, !dbg !135
  %add = add i64 %3, 1, !dbg !136
  %cmp = icmp ult i64 %2, %add, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !141
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !141
  %6 = load i8*, i8** %data, align 8, !dbg !142
  %7 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !142
  store i8 %5, i8* %arrayidx4, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %8, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !150
  call void @printLine(i8* %9), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !153 {
entry:
  ret i32 0, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  %call = call i32 @staticReturnsTrue(), !dbg !162
  %tobool = icmp ne i32 %call, 0, !dbg !162
  br i1 %tobool, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !165
  store i8* %arraydecay, i8** %data, align 8, !dbg !167
  %0 = load i8*, i8** %data, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  br label %if.end, !dbg !170

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !171, metadata !DIExpression()), !dbg !173
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !173
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !173
  call void @llvm.dbg.declare(metadata i64* %i, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !176, metadata !DIExpression()), !dbg !177
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !178
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !179
  store i64 %call2, i64* %sourceLen, align 8, !dbg !180
  store i64 0, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !184
  %3 = load i64, i64* %sourceLen, align 8, !dbg !186
  %add = add i64 %3, 1, !dbg !187
  %cmp = icmp ult i64 %2, %add, !dbg !188
  br i1 %cmp, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !192
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !192
  %6 = load i8*, i8** %data, align 8, !dbg !193
  %7 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !193
  store i8 %5, i8* %arrayidx4, align 1, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %8, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !201
  call void @printLine(i8* %9), !dbg !202
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08_bad", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 44, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 44, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 45, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 45, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 46, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 46, column: 10, scope: !11)
!29 = !DILocation(line: 47, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 8)
!31 = !DILocation(line: 47, column: 8, scope: !11)
!32 = !DILocation(line: 51, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 48, column: 5)
!34 = !DILocation(line: 51, column: 14, scope: !33)
!35 = !DILocation(line: 52, column: 9, scope: !33)
!36 = !DILocation(line: 52, column: 17, scope: !33)
!37 = !DILocation(line: 53, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 55, type: !25)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 54, column: 5)
!40 = !DILocation(line: 55, column: 14, scope: !39)
!41 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 56, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 56, column: 16, scope: !39)
!46 = !DILocalVariable(name: "sourceLen", scope: !39, file: !12, line: 56, type: !42)
!47 = !DILocation(line: 56, column: 19, scope: !39)
!48 = !DILocation(line: 57, column: 28, scope: !39)
!49 = !DILocation(line: 57, column: 21, scope: !39)
!50 = !DILocation(line: 57, column: 19, scope: !39)
!51 = !DILocation(line: 60, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !39, file: !12, line: 60, column: 9)
!53 = !DILocation(line: 60, column: 14, scope: !52)
!54 = !DILocation(line: 60, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 60, column: 9)
!56 = !DILocation(line: 60, column: 25, scope: !55)
!57 = !DILocation(line: 60, column: 35, scope: !55)
!58 = !DILocation(line: 60, column: 23, scope: !55)
!59 = !DILocation(line: 60, column: 9, scope: !52)
!60 = !DILocation(line: 62, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !12, line: 61, column: 9)
!62 = !DILocation(line: 62, column: 23, scope: !61)
!63 = !DILocation(line: 62, column: 13, scope: !61)
!64 = !DILocation(line: 62, column: 18, scope: !61)
!65 = !DILocation(line: 62, column: 21, scope: !61)
!66 = !DILocation(line: 63, column: 9, scope: !61)
!67 = !DILocation(line: 60, column: 41, scope: !55)
!68 = !DILocation(line: 60, column: 9, scope: !55)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 63, column: 9, scope: !52)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 64, column: 19, scope: !39)
!73 = !DILocation(line: 64, column: 9, scope: !39)
!74 = !DILocation(line: 66, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_08_good", scope: !12, file: !12, line: 131, type: !13, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 133, column: 5, scope: !75)
!77 = !DILocation(line: 134, column: 5, scope: !75)
!78 = !DILocation(line: 135, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 147, type: !80, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 147, type: !82)
!85 = !DILocation(line: 147, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 147, type: !83)
!87 = !DILocation(line: 147, column: 27, scope: !79)
!88 = !DILocation(line: 150, column: 22, scope: !79)
!89 = !DILocation(line: 150, column: 12, scope: !79)
!90 = !DILocation(line: 150, column: 5, scope: !79)
!91 = !DILocation(line: 152, column: 5, scope: !79)
!92 = !DILocation(line: 153, column: 5, scope: !79)
!93 = !DILocation(line: 154, column: 5, scope: !79)
!94 = !DILocation(line: 157, column: 5, scope: !79)
!95 = !DILocation(line: 158, column: 5, scope: !79)
!96 = !DILocation(line: 159, column: 5, scope: !79)
!97 = !DILocation(line: 161, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 30, type: !99, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!82}
!101 = !DILocation(line: 32, column: 5, scope: !98)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 75, type: !16)
!104 = !DILocation(line: 75, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !12, line: 76, type: !20)
!106 = !DILocation(line: 76, column: 10, scope: !102)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !12, line: 77, type: !25)
!108 = !DILocation(line: 77, column: 10, scope: !102)
!109 = !DILocation(line: 78, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !12, line: 78, column: 8)
!111 = !DILocation(line: 78, column: 8, scope: !102)
!112 = !DILocation(line: 81, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 79, column: 5)
!114 = !DILocation(line: 82, column: 5, scope: !113)
!115 = !DILocation(line: 87, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !12, line: 84, column: 5)
!117 = !DILocation(line: 87, column: 14, scope: !116)
!118 = !DILocation(line: 88, column: 9, scope: !116)
!119 = !DILocation(line: 88, column: 17, scope: !116)
!120 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 91, type: !25)
!121 = distinct !DILexicalBlock(scope: !102, file: !12, line: 90, column: 5)
!122 = !DILocation(line: 91, column: 14, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !12, line: 92, type: !42)
!124 = !DILocation(line: 92, column: 16, scope: !121)
!125 = !DILocalVariable(name: "sourceLen", scope: !121, file: !12, line: 92, type: !42)
!126 = !DILocation(line: 92, column: 19, scope: !121)
!127 = !DILocation(line: 93, column: 28, scope: !121)
!128 = !DILocation(line: 93, column: 21, scope: !121)
!129 = !DILocation(line: 93, column: 19, scope: !121)
!130 = !DILocation(line: 96, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !121, file: !12, line: 96, column: 9)
!132 = !DILocation(line: 96, column: 14, scope: !131)
!133 = !DILocation(line: 96, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 96, column: 9)
!135 = !DILocation(line: 96, column: 25, scope: !134)
!136 = !DILocation(line: 96, column: 35, scope: !134)
!137 = !DILocation(line: 96, column: 23, scope: !134)
!138 = !DILocation(line: 96, column: 9, scope: !131)
!139 = !DILocation(line: 98, column: 30, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !12, line: 97, column: 9)
!141 = !DILocation(line: 98, column: 23, scope: !140)
!142 = !DILocation(line: 98, column: 13, scope: !140)
!143 = !DILocation(line: 98, column: 18, scope: !140)
!144 = !DILocation(line: 98, column: 21, scope: !140)
!145 = !DILocation(line: 99, column: 9, scope: !140)
!146 = !DILocation(line: 96, column: 41, scope: !134)
!147 = !DILocation(line: 96, column: 9, scope: !134)
!148 = distinct !{!148, !138, !149, !71}
!149 = !DILocation(line: 99, column: 9, scope: !131)
!150 = !DILocation(line: 100, column: 19, scope: !121)
!151 = !DILocation(line: 100, column: 9, scope: !121)
!152 = !DILocation(line: 102, column: 1, scope: !102)
!153 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 35, type: !99, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocation(line: 37, column: 5, scope: !153)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocalVariable(name: "data", scope: !155, file: !12, line: 107, type: !16)
!157 = !DILocation(line: 107, column: 12, scope: !155)
!158 = !DILocalVariable(name: "dataBadBuffer", scope: !155, file: !12, line: 108, type: !20)
!159 = !DILocation(line: 108, column: 10, scope: !155)
!160 = !DILocalVariable(name: "dataGoodBuffer", scope: !155, file: !12, line: 109, type: !25)
!161 = !DILocation(line: 109, column: 10, scope: !155)
!162 = !DILocation(line: 110, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !155, file: !12, line: 110, column: 8)
!164 = !DILocation(line: 110, column: 8, scope: !155)
!165 = !DILocation(line: 114, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 111, column: 5)
!167 = !DILocation(line: 114, column: 14, scope: !166)
!168 = !DILocation(line: 115, column: 9, scope: !166)
!169 = !DILocation(line: 115, column: 17, scope: !166)
!170 = !DILocation(line: 116, column: 5, scope: !166)
!171 = !DILocalVariable(name: "source", scope: !172, file: !12, line: 118, type: !25)
!172 = distinct !DILexicalBlock(scope: !155, file: !12, line: 117, column: 5)
!173 = !DILocation(line: 118, column: 14, scope: !172)
!174 = !DILocalVariable(name: "i", scope: !172, file: !12, line: 119, type: !42)
!175 = !DILocation(line: 119, column: 16, scope: !172)
!176 = !DILocalVariable(name: "sourceLen", scope: !172, file: !12, line: 119, type: !42)
!177 = !DILocation(line: 119, column: 19, scope: !172)
!178 = !DILocation(line: 120, column: 28, scope: !172)
!179 = !DILocation(line: 120, column: 21, scope: !172)
!180 = !DILocation(line: 120, column: 19, scope: !172)
!181 = !DILocation(line: 123, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !172, file: !12, line: 123, column: 9)
!183 = !DILocation(line: 123, column: 14, scope: !182)
!184 = !DILocation(line: 123, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !12, line: 123, column: 9)
!186 = !DILocation(line: 123, column: 25, scope: !185)
!187 = !DILocation(line: 123, column: 35, scope: !185)
!188 = !DILocation(line: 123, column: 23, scope: !185)
!189 = !DILocation(line: 123, column: 9, scope: !182)
!190 = !DILocation(line: 125, column: 30, scope: !191)
!191 = distinct !DILexicalBlock(scope: !185, file: !12, line: 124, column: 9)
!192 = !DILocation(line: 125, column: 23, scope: !191)
!193 = !DILocation(line: 125, column: 13, scope: !191)
!194 = !DILocation(line: 125, column: 18, scope: !191)
!195 = !DILocation(line: 125, column: 21, scope: !191)
!196 = !DILocation(line: 126, column: 9, scope: !191)
!197 = !DILocation(line: 123, column: 41, scope: !185)
!198 = !DILocation(line: 123, column: 9, scope: !185)
!199 = distinct !{!199, !189, !200, !71}
!200 = !DILocation(line: 126, column: 9, scope: !182)
!201 = !DILocation(line: 127, column: 19, scope: !172)
!202 = !DILocation(line: 127, column: 9, scope: !172)
!203 = !DILocation(line: 129, column: 1, scope: !155)
