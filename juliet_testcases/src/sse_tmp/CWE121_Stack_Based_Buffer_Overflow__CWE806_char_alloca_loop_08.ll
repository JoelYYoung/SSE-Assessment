; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %call = call i32 @staticReturnsTrue(), !dbg !24
  %tobool = icmp ne i32 %call, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !44, metadata !DIExpression()), !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  %call1 = call i64 @strlen(i8* %5) #6, !dbg !47
  store i64 %call1, i64* %dataLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !52
  %7 = load i64, i64* %dataLen, align 8, !dbg !54
  %cmp = icmp ult i64 %6, %7, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !57
  %9 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !57
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !57
  %11 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !61
  store i8 %10, i8* %arrayidx3, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %12, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !69
  store i8 0, i8* %arrayidx4, align 1, !dbg !70
  %13 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %13), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_good() #0 !dbg !74 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_bad(), !dbg !94
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
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 100, align 16, !dbg !106
  store i8* %0, i8** %dataBuffer, align 8, !dbg !105
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  store i8* %1, i8** %data, align 8, !dbg !108
  %call = call i32 @staticReturnsFalse(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !125, metadata !DIExpression()), !dbg !126
  %5 = load i8*, i8** %data, align 8, !dbg !127
  %call1 = call i64 @strlen(i8* %5) #6, !dbg !128
  store i64 %call1, i64* %dataLen, align 8, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !133
  %7 = load i64, i64* %dataLen, align 8, !dbg !135
  %cmp = icmp ult i64 %6, %7, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !138
  %9 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !138
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !138
  %11 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !142
  store i8 %10, i8* %arrayidx3, align 1, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %12, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !149
  store i8 0, i8* %arrayidx4, align 1, !dbg !150
  %13 = load i8*, i8** %data, align 8, !dbg !151
  call void @printLine(i8* %13), !dbg !152
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
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = alloca i8, i64 100, align 16, !dbg !161
  store i8* %0, i8** %dataBuffer, align 8, !dbg !160
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !162
  store i8* %1, i8** %data, align 8, !dbg !163
  %call = call i32 @staticReturnsTrue(), !dbg !164
  %tobool = icmp ne i32 %call, 0, !dbg !164
  br i1 %tobool, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !169
  %3 = load i8*, i8** %data, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !173, metadata !DIExpression()), !dbg !175
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !178, metadata !DIExpression()), !dbg !179
  %5 = load i8*, i8** %data, align 8, !dbg !180
  %call1 = call i64 @strlen(i8* %5) #6, !dbg !181
  store i64 %call1, i64* %dataLen, align 8, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !186
  %7 = load i64, i64* %dataLen, align 8, !dbg !188
  %cmp = icmp ult i64 %6, %7, !dbg !189
  br i1 %cmp, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !191
  %9 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !191
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !191
  %11 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !195
  store i8 %10, i8* %arrayidx3, align 1, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !198
  %inc = add i64 %12, 1, !dbg !198
  store i64 %inc, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !202
  store i8 0, i8* %arrayidx4, align 1, !dbg !203
  %13 = load i8*, i8** %data, align 8, !dbg !204
  call void @printLine(i8* %13), !dbg !205
  ret void, !dbg !206
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 33, scope: !13)
!22 = !DILocation(line: 41, column: 12, scope: !13)
!23 = !DILocation(line: 41, column: 10, scope: !13)
!24 = !DILocation(line: 42, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 8)
!26 = !DILocation(line: 42, column: 8, scope: !13)
!27 = !DILocation(line: 45, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !14, line: 43, column: 5)
!29 = !DILocation(line: 45, column: 9, scope: !28)
!30 = !DILocation(line: 46, column: 9, scope: !28)
!31 = !DILocation(line: 46, column: 21, scope: !28)
!32 = !DILocation(line: 47, column: 5, scope: !28)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !14, line: 49, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 48, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 49, column: 14, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !14, line: 50, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 50, column: 16, scope: !34)
!44 = !DILocalVariable(name: "dataLen", scope: !34, file: !14, line: 50, type: !40)
!45 = !DILocation(line: 50, column: 19, scope: !34)
!46 = !DILocation(line: 51, column: 26, scope: !34)
!47 = !DILocation(line: 51, column: 19, scope: !34)
!48 = !DILocation(line: 51, column: 17, scope: !34)
!49 = !DILocation(line: 53, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !34, file: !14, line: 53, column: 9)
!51 = !DILocation(line: 53, column: 14, scope: !50)
!52 = !DILocation(line: 53, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !14, line: 53, column: 9)
!54 = !DILocation(line: 53, column: 25, scope: !53)
!55 = !DILocation(line: 53, column: 23, scope: !53)
!56 = !DILocation(line: 53, column: 9, scope: !50)
!57 = !DILocation(line: 55, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !14, line: 54, column: 9)
!59 = !DILocation(line: 55, column: 28, scope: !58)
!60 = !DILocation(line: 55, column: 18, scope: !58)
!61 = !DILocation(line: 55, column: 13, scope: !58)
!62 = !DILocation(line: 55, column: 21, scope: !58)
!63 = !DILocation(line: 56, column: 9, scope: !58)
!64 = !DILocation(line: 53, column: 35, scope: !53)
!65 = !DILocation(line: 53, column: 9, scope: !53)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 56, column: 9, scope: !50)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 57, column: 9, scope: !34)
!70 = !DILocation(line: 57, column: 20, scope: !34)
!71 = !DILocation(line: 58, column: 19, scope: !34)
!72 = !DILocation(line: 58, column: 9, scope: !34)
!73 = !DILocation(line: 60, column: 1, scope: !13)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_good", scope: !14, file: !14, line: 123, type: !15, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 125, column: 5, scope: !74)
!76 = !DILocation(line: 126, column: 5, scope: !74)
!77 = !DILocation(line: 127, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 139, type: !79, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !14, line: 139, type: !81)
!84 = !DILocation(line: 139, column: 14, scope: !78)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !14, line: 139, type: !82)
!86 = !DILocation(line: 139, column: 27, scope: !78)
!87 = !DILocation(line: 142, column: 22, scope: !78)
!88 = !DILocation(line: 142, column: 12, scope: !78)
!89 = !DILocation(line: 142, column: 5, scope: !78)
!90 = !DILocation(line: 144, column: 5, scope: !78)
!91 = !DILocation(line: 145, column: 5, scope: !78)
!92 = !DILocation(line: 146, column: 5, scope: !78)
!93 = !DILocation(line: 149, column: 5, scope: !78)
!94 = !DILocation(line: 150, column: 5, scope: !78)
!95 = !DILocation(line: 151, column: 5, scope: !78)
!96 = !DILocation(line: 153, column: 5, scope: !78)
!97 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !98, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!81}
!100 = !DILocation(line: 27, column: 5, scope: !97)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 69, type: !4)
!103 = !DILocation(line: 69, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !14, line: 70, type: !4)
!105 = !DILocation(line: 70, column: 12, scope: !101)
!106 = !DILocation(line: 70, column: 33, scope: !101)
!107 = !DILocation(line: 71, column: 12, scope: !101)
!108 = !DILocation(line: 71, column: 10, scope: !101)
!109 = !DILocation(line: 72, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !14, line: 72, column: 8)
!111 = !DILocation(line: 72, column: 8, scope: !101)
!112 = !DILocation(line: 75, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !14, line: 73, column: 5)
!114 = !DILocation(line: 76, column: 5, scope: !113)
!115 = !DILocation(line: 80, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !14, line: 78, column: 5)
!117 = !DILocation(line: 80, column: 9, scope: !116)
!118 = !DILocation(line: 81, column: 9, scope: !116)
!119 = !DILocation(line: 81, column: 20, scope: !116)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !14, line: 84, type: !35)
!121 = distinct !DILexicalBlock(scope: !101, file: !14, line: 83, column: 5)
!122 = !DILocation(line: 84, column: 14, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !14, line: 85, type: !40)
!124 = !DILocation(line: 85, column: 16, scope: !121)
!125 = !DILocalVariable(name: "dataLen", scope: !121, file: !14, line: 85, type: !40)
!126 = !DILocation(line: 85, column: 19, scope: !121)
!127 = !DILocation(line: 86, column: 26, scope: !121)
!128 = !DILocation(line: 86, column: 19, scope: !121)
!129 = !DILocation(line: 86, column: 17, scope: !121)
!130 = !DILocation(line: 88, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !121, file: !14, line: 88, column: 9)
!132 = !DILocation(line: 88, column: 14, scope: !131)
!133 = !DILocation(line: 88, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !14, line: 88, column: 9)
!135 = !DILocation(line: 88, column: 25, scope: !134)
!136 = !DILocation(line: 88, column: 23, scope: !134)
!137 = !DILocation(line: 88, column: 9, scope: !131)
!138 = !DILocation(line: 90, column: 23, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !14, line: 89, column: 9)
!140 = !DILocation(line: 90, column: 28, scope: !139)
!141 = !DILocation(line: 90, column: 18, scope: !139)
!142 = !DILocation(line: 90, column: 13, scope: !139)
!143 = !DILocation(line: 90, column: 21, scope: !139)
!144 = !DILocation(line: 91, column: 9, scope: !139)
!145 = !DILocation(line: 88, column: 35, scope: !134)
!146 = !DILocation(line: 88, column: 9, scope: !134)
!147 = distinct !{!147, !137, !148, !68}
!148 = !DILocation(line: 91, column: 9, scope: !131)
!149 = !DILocation(line: 92, column: 9, scope: !121)
!150 = !DILocation(line: 92, column: 20, scope: !121)
!151 = !DILocation(line: 93, column: 19, scope: !121)
!152 = !DILocation(line: 93, column: 9, scope: !121)
!153 = !DILocation(line: 95, column: 1, scope: !101)
!154 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !98, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocation(line: 32, column: 5, scope: !154)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 98, type: !15, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocalVariable(name: "data", scope: !156, file: !14, line: 100, type: !4)
!158 = !DILocation(line: 100, column: 12, scope: !156)
!159 = !DILocalVariable(name: "dataBuffer", scope: !156, file: !14, line: 101, type: !4)
!160 = !DILocation(line: 101, column: 12, scope: !156)
!161 = !DILocation(line: 101, column: 33, scope: !156)
!162 = !DILocation(line: 102, column: 12, scope: !156)
!163 = !DILocation(line: 102, column: 10, scope: !156)
!164 = !DILocation(line: 103, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !156, file: !14, line: 103, column: 8)
!166 = !DILocation(line: 103, column: 8, scope: !156)
!167 = !DILocation(line: 106, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !14, line: 104, column: 5)
!169 = !DILocation(line: 106, column: 9, scope: !168)
!170 = !DILocation(line: 107, column: 9, scope: !168)
!171 = !DILocation(line: 107, column: 20, scope: !168)
!172 = !DILocation(line: 108, column: 5, scope: !168)
!173 = !DILocalVariable(name: "dest", scope: !174, file: !14, line: 110, type: !35)
!174 = distinct !DILexicalBlock(scope: !156, file: !14, line: 109, column: 5)
!175 = !DILocation(line: 110, column: 14, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !174, file: !14, line: 111, type: !40)
!177 = !DILocation(line: 111, column: 16, scope: !174)
!178 = !DILocalVariable(name: "dataLen", scope: !174, file: !14, line: 111, type: !40)
!179 = !DILocation(line: 111, column: 19, scope: !174)
!180 = !DILocation(line: 112, column: 26, scope: !174)
!181 = !DILocation(line: 112, column: 19, scope: !174)
!182 = !DILocation(line: 112, column: 17, scope: !174)
!183 = !DILocation(line: 114, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !14, line: 114, column: 9)
!185 = !DILocation(line: 114, column: 14, scope: !184)
!186 = !DILocation(line: 114, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !14, line: 114, column: 9)
!188 = !DILocation(line: 114, column: 25, scope: !187)
!189 = !DILocation(line: 114, column: 23, scope: !187)
!190 = !DILocation(line: 114, column: 9, scope: !184)
!191 = !DILocation(line: 116, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !14, line: 115, column: 9)
!193 = !DILocation(line: 116, column: 28, scope: !192)
!194 = !DILocation(line: 116, column: 18, scope: !192)
!195 = !DILocation(line: 116, column: 13, scope: !192)
!196 = !DILocation(line: 116, column: 21, scope: !192)
!197 = !DILocation(line: 117, column: 9, scope: !192)
!198 = !DILocation(line: 114, column: 35, scope: !187)
!199 = !DILocation(line: 114, column: 9, scope: !187)
!200 = distinct !{!200, !190, !201, !68}
!201 = !DILocation(line: 117, column: 9, scope: !184)
!202 = !DILocation(line: 118, column: 9, scope: !174)
!203 = !DILocation(line: 118, column: 20, scope: !174)
!204 = !DILocation(line: 119, column: 19, scope: !174)
!205 = !DILocation(line: 119, column: 9, scope: !174)
!206 = !DILocation(line: 121, column: 1, scope: !156)
