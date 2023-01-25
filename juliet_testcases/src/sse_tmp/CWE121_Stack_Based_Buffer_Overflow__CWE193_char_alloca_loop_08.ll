; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08_bad() #0 !dbg !13 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %2, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !48
  store i64 %call1, i64* %sourceLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !53
  %6 = load i64, i64* %sourceLen, align 8, !dbg !55
  %add = add i64 %6, 1, !dbg !56
  %cmp = icmp ult i64 %5, %add, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !61
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !61
  %9 = load i8*, i8** %data, align 8, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !62
  store i8 %8, i8* %arrayidx3, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %11, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %12), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !97 {
entry:
  ret i32 1, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 10, align 16, !dbg !106
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %1 = alloca i8, i64 11, align 16, !dbg !109
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !108
  %call = call i32 @staticReturnsFalse(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !116
  store i8* %2, i8** %data, align 8, !dbg !118
  %3 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !128
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !129
  store i64 %call1, i64* %sourceLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !134
  %6 = load i64, i64* %sourceLen, align 8, !dbg !136
  %add = add i64 %6, 1, !dbg !137
  %cmp = icmp ult i64 %5, %add, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !142
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !142
  %9 = load i8*, i8** %data, align 8, !dbg !143
  %10 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !143
  store i8 %8, i8* %arrayidx3, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %11, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !151
  call void @printLine(i8* %12), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !154 {
entry:
  ret i32 0, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = alloca i8, i64 10, align 16, !dbg !161
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !160
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %1 = alloca i8, i64 11, align 16, !dbg !164
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !163
  %call = call i32 @staticReturnsTrue(), !dbg !165
  %tobool = icmp ne i32 %call, 0, !dbg !165
  br i1 %tobool, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !168
  store i8* %2, i8** %data, align 8, !dbg !170
  %3 = load i8*, i8** %data, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !171
  store i8 0, i8* %arrayidx, align 1, !dbg !172
  br label %if.end, !dbg !173

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !174, metadata !DIExpression()), !dbg !176
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !176
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %i, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !179, metadata !DIExpression()), !dbg !180
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !181
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !182
  store i64 %call1, i64* %sourceLen, align 8, !dbg !183
  store i64 0, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !187
  %6 = load i64, i64* %sourceLen, align 8, !dbg !189
  %add = add i64 %6, 1, !dbg !190
  %cmp = icmp ult i64 %5, %add, !dbg !191
  br i1 %cmp, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !195
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !195
  %9 = load i8*, i8** %data, align 8, !dbg !196
  %10 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !196
  store i8 %8, i8* %arrayidx3, align 1, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %11, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !204
  call void @printLine(i8* %12), !dbg !205
  ret void, !dbg !206
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08_bad", scope: !14, file: !14, line: 42, type: !15, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 44, type: !4)
!18 = !DILocation(line: 44, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 45, type: !4)
!20 = !DILocation(line: 45, column: 12, scope: !13)
!21 = !DILocation(line: 45, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 46, type: !4)
!23 = !DILocation(line: 46, column: 12, scope: !13)
!24 = !DILocation(line: 46, column: 37, scope: !13)
!25 = !DILocation(line: 47, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 47, column: 8)
!27 = !DILocation(line: 47, column: 8, scope: !13)
!28 = !DILocation(line: 51, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 48, column: 5)
!30 = !DILocation(line: 51, column: 14, scope: !29)
!31 = !DILocation(line: 52, column: 9, scope: !29)
!32 = !DILocation(line: 52, column: 17, scope: !29)
!33 = !DILocation(line: 53, column: 5, scope: !29)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 55, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 54, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 55, column: 14, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !14, line: 56, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 56, column: 16, scope: !35)
!45 = !DILocalVariable(name: "sourceLen", scope: !35, file: !14, line: 56, type: !41)
!46 = !DILocation(line: 56, column: 19, scope: !35)
!47 = !DILocation(line: 57, column: 28, scope: !35)
!48 = !DILocation(line: 57, column: 21, scope: !35)
!49 = !DILocation(line: 57, column: 19, scope: !35)
!50 = !DILocation(line: 60, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !35, file: !14, line: 60, column: 9)
!52 = !DILocation(line: 60, column: 14, scope: !51)
!53 = !DILocation(line: 60, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !14, line: 60, column: 9)
!55 = !DILocation(line: 60, column: 25, scope: !54)
!56 = !DILocation(line: 60, column: 35, scope: !54)
!57 = !DILocation(line: 60, column: 23, scope: !54)
!58 = !DILocation(line: 60, column: 9, scope: !51)
!59 = !DILocation(line: 62, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !14, line: 61, column: 9)
!61 = !DILocation(line: 62, column: 23, scope: !60)
!62 = !DILocation(line: 62, column: 13, scope: !60)
!63 = !DILocation(line: 62, column: 18, scope: !60)
!64 = !DILocation(line: 62, column: 21, scope: !60)
!65 = !DILocation(line: 63, column: 9, scope: !60)
!66 = !DILocation(line: 60, column: 41, scope: !54)
!67 = !DILocation(line: 60, column: 9, scope: !54)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 63, column: 9, scope: !51)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 64, column: 19, scope: !35)
!72 = !DILocation(line: 64, column: 9, scope: !35)
!73 = !DILocation(line: 66, column: 1, scope: !13)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_08_good", scope: !14, file: !14, line: 131, type: !15, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 133, column: 5, scope: !74)
!76 = !DILocation(line: 134, column: 5, scope: !74)
!77 = !DILocation(line: 135, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 147, type: !79, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !14, line: 147, type: !81)
!84 = !DILocation(line: 147, column: 14, scope: !78)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !14, line: 147, type: !82)
!86 = !DILocation(line: 147, column: 27, scope: !78)
!87 = !DILocation(line: 150, column: 22, scope: !78)
!88 = !DILocation(line: 150, column: 12, scope: !78)
!89 = !DILocation(line: 150, column: 5, scope: !78)
!90 = !DILocation(line: 152, column: 5, scope: !78)
!91 = !DILocation(line: 153, column: 5, scope: !78)
!92 = !DILocation(line: 154, column: 5, scope: !78)
!93 = !DILocation(line: 157, column: 5, scope: !78)
!94 = !DILocation(line: 158, column: 5, scope: !78)
!95 = !DILocation(line: 159, column: 5, scope: !78)
!96 = !DILocation(line: 161, column: 5, scope: !78)
!97 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 30, type: !98, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!81}
!100 = !DILocation(line: 32, column: 5, scope: !97)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 75, type: !4)
!103 = !DILocation(line: 75, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !14, line: 76, type: !4)
!105 = !DILocation(line: 76, column: 12, scope: !101)
!106 = !DILocation(line: 76, column: 36, scope: !101)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !14, line: 77, type: !4)
!108 = !DILocation(line: 77, column: 12, scope: !101)
!109 = !DILocation(line: 77, column: 37, scope: !101)
!110 = !DILocation(line: 78, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !101, file: !14, line: 78, column: 8)
!112 = !DILocation(line: 78, column: 8, scope: !101)
!113 = !DILocation(line: 81, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !14, line: 79, column: 5)
!115 = !DILocation(line: 82, column: 5, scope: !114)
!116 = !DILocation(line: 87, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !14, line: 84, column: 5)
!118 = !DILocation(line: 87, column: 14, scope: !117)
!119 = !DILocation(line: 88, column: 9, scope: !117)
!120 = !DILocation(line: 88, column: 17, scope: !117)
!121 = !DILocalVariable(name: "source", scope: !122, file: !14, line: 91, type: !36)
!122 = distinct !DILexicalBlock(scope: !101, file: !14, line: 90, column: 5)
!123 = !DILocation(line: 91, column: 14, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !14, line: 92, type: !41)
!125 = !DILocation(line: 92, column: 16, scope: !122)
!126 = !DILocalVariable(name: "sourceLen", scope: !122, file: !14, line: 92, type: !41)
!127 = !DILocation(line: 92, column: 19, scope: !122)
!128 = !DILocation(line: 93, column: 28, scope: !122)
!129 = !DILocation(line: 93, column: 21, scope: !122)
!130 = !DILocation(line: 93, column: 19, scope: !122)
!131 = !DILocation(line: 96, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !14, line: 96, column: 9)
!133 = !DILocation(line: 96, column: 14, scope: !132)
!134 = !DILocation(line: 96, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !14, line: 96, column: 9)
!136 = !DILocation(line: 96, column: 25, scope: !135)
!137 = !DILocation(line: 96, column: 35, scope: !135)
!138 = !DILocation(line: 96, column: 23, scope: !135)
!139 = !DILocation(line: 96, column: 9, scope: !132)
!140 = !DILocation(line: 98, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !14, line: 97, column: 9)
!142 = !DILocation(line: 98, column: 23, scope: !141)
!143 = !DILocation(line: 98, column: 13, scope: !141)
!144 = !DILocation(line: 98, column: 18, scope: !141)
!145 = !DILocation(line: 98, column: 21, scope: !141)
!146 = !DILocation(line: 99, column: 9, scope: !141)
!147 = !DILocation(line: 96, column: 41, scope: !135)
!148 = !DILocation(line: 96, column: 9, scope: !135)
!149 = distinct !{!149, !139, !150, !70}
!150 = !DILocation(line: 99, column: 9, scope: !132)
!151 = !DILocation(line: 100, column: 19, scope: !122)
!152 = !DILocation(line: 100, column: 9, scope: !122)
!153 = !DILocation(line: 102, column: 1, scope: !101)
!154 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 35, type: !98, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocation(line: 37, column: 5, scope: !154)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 105, type: !15, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocalVariable(name: "data", scope: !156, file: !14, line: 107, type: !4)
!158 = !DILocation(line: 107, column: 12, scope: !156)
!159 = !DILocalVariable(name: "dataBadBuffer", scope: !156, file: !14, line: 108, type: !4)
!160 = !DILocation(line: 108, column: 12, scope: !156)
!161 = !DILocation(line: 108, column: 36, scope: !156)
!162 = !DILocalVariable(name: "dataGoodBuffer", scope: !156, file: !14, line: 109, type: !4)
!163 = !DILocation(line: 109, column: 12, scope: !156)
!164 = !DILocation(line: 109, column: 37, scope: !156)
!165 = !DILocation(line: 110, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !156, file: !14, line: 110, column: 8)
!167 = !DILocation(line: 110, column: 8, scope: !156)
!168 = !DILocation(line: 114, column: 16, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !14, line: 111, column: 5)
!170 = !DILocation(line: 114, column: 14, scope: !169)
!171 = !DILocation(line: 115, column: 9, scope: !169)
!172 = !DILocation(line: 115, column: 17, scope: !169)
!173 = !DILocation(line: 116, column: 5, scope: !169)
!174 = !DILocalVariable(name: "source", scope: !175, file: !14, line: 118, type: !36)
!175 = distinct !DILexicalBlock(scope: !156, file: !14, line: 117, column: 5)
!176 = !DILocation(line: 118, column: 14, scope: !175)
!177 = !DILocalVariable(name: "i", scope: !175, file: !14, line: 119, type: !41)
!178 = !DILocation(line: 119, column: 16, scope: !175)
!179 = !DILocalVariable(name: "sourceLen", scope: !175, file: !14, line: 119, type: !41)
!180 = !DILocation(line: 119, column: 19, scope: !175)
!181 = !DILocation(line: 120, column: 28, scope: !175)
!182 = !DILocation(line: 120, column: 21, scope: !175)
!183 = !DILocation(line: 120, column: 19, scope: !175)
!184 = !DILocation(line: 123, column: 16, scope: !185)
!185 = distinct !DILexicalBlock(scope: !175, file: !14, line: 123, column: 9)
!186 = !DILocation(line: 123, column: 14, scope: !185)
!187 = !DILocation(line: 123, column: 21, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !14, line: 123, column: 9)
!189 = !DILocation(line: 123, column: 25, scope: !188)
!190 = !DILocation(line: 123, column: 35, scope: !188)
!191 = !DILocation(line: 123, column: 23, scope: !188)
!192 = !DILocation(line: 123, column: 9, scope: !185)
!193 = !DILocation(line: 125, column: 30, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !14, line: 124, column: 9)
!195 = !DILocation(line: 125, column: 23, scope: !194)
!196 = !DILocation(line: 125, column: 13, scope: !194)
!197 = !DILocation(line: 125, column: 18, scope: !194)
!198 = !DILocation(line: 125, column: 21, scope: !194)
!199 = !DILocation(line: 126, column: 9, scope: !194)
!200 = !DILocation(line: 123, column: 41, scope: !188)
!201 = !DILocation(line: 123, column: 9, scope: !188)
!202 = distinct !{!202, !192, !203, !70}
!203 = !DILocation(line: 126, column: 9, scope: !185)
!204 = !DILocation(line: 127, column: 19, scope: !175)
!205 = !DILocation(line: 127, column: 9, scope: !175)
!206 = !DILocation(line: 129, column: 1, scope: !156)
