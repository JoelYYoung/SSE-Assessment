; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i32, i32* @globalFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !47, metadata !DIExpression()), !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  %call = call i64 @strlen(i8* %4) #6, !dbg !50
  store i64 %call, i64* %dataLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !55
  %6 = load i64, i64* %dataLen, align 8, !dbg !57
  %cmp1 = icmp ult i64 %5, %6, !dbg !58
  br i1 %cmp1, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !60
  %8 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !60
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !60
  %10 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !64
  store i8 %9, i8* %arrayidx3, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %11, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !72
  store i8 0, i8* %arrayidx4, align 1, !dbg !73
  %12 = load i8*, i8** %data, align 8, !dbg !74
  call void @printLine(i8* %12), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_14_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #7, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #7, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_14_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_14_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !105
  store i8* %arraydecay, i8** %data, align 8, !dbg !106
  %0 = load i32, i32* @globalFive, align 4, !dbg !107
  %cmp = icmp ne i32 %0, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !116
  %2 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !124, metadata !DIExpression()), !dbg !125
  %4 = load i8*, i8** %data, align 8, !dbg !126
  %call = call i64 @strlen(i8* %4) #6, !dbg !127
  store i64 %call, i64* %dataLen, align 8, !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !132
  %6 = load i64, i64* %dataLen, align 8, !dbg !134
  %cmp1 = icmp ult i64 %5, %6, !dbg !135
  br i1 %cmp1, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !137
  %8 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !137
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !137
  %10 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !141
  store i8 %9, i8* %arrayidx3, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %11, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !148
  store i8 0, i8* %arrayidx4, align 1, !dbg !149
  %12 = load i8*, i8** %data, align 8, !dbg !150
  call void @printLine(i8* %12), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !158
  store i8* %arraydecay, i8** %data, align 8, !dbg !159
  %0 = load i32, i32* @globalFive, align 4, !dbg !160
  %cmp = icmp eq i32 %0, 5, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !166
  %2 = load i8*, i8** %data, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !170, metadata !DIExpression()), !dbg !172
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !175, metadata !DIExpression()), !dbg !176
  %4 = load i8*, i8** %data, align 8, !dbg !177
  %call = call i64 @strlen(i8* %4) #6, !dbg !178
  store i64 %call, i64* %dataLen, align 8, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !183
  %6 = load i64, i64* %dataLen, align 8, !dbg !185
  %cmp1 = icmp ult i64 %5, %6, !dbg !186
  br i1 %cmp1, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !188
  %8 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !188
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !188
  %10 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !192
  store i8 %9, i8* %arrayidx3, align 1, !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !195
  %inc = add i64 %11, 1, !dbg !195
  store i64 %inc, i64* %i, align 8, !dbg !195
  br label %for.cond, !dbg !196, !llvm.loop !197

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !199
  store i8 0, i8* %arrayidx4, align 1, !dbg !200
  %12 = load i8*, i8** %data, align 8, !dbg !201
  call void @printLine(i8* %12), !dbg !202
  ret void, !dbg !203
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 12, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!28 = !DILocation(line: 28, column: 18, scope: !27)
!29 = !DILocation(line: 28, column: 8, scope: !11)
!30 = !DILocation(line: 31, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 31, column: 9, scope: !31)
!33 = !DILocation(line: 32, column: 9, scope: !31)
!34 = !DILocation(line: 32, column: 21, scope: !31)
!35 = !DILocation(line: 33, column: 5, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 35, column: 14, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 36, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 36, column: 16, scope: !37)
!47 = !DILocalVariable(name: "dataLen", scope: !37, file: !12, line: 36, type: !43)
!48 = !DILocation(line: 36, column: 19, scope: !37)
!49 = !DILocation(line: 37, column: 26, scope: !37)
!50 = !DILocation(line: 37, column: 19, scope: !37)
!51 = !DILocation(line: 37, column: 17, scope: !37)
!52 = !DILocation(line: 39, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !37, file: !12, line: 39, column: 9)
!54 = !DILocation(line: 39, column: 14, scope: !53)
!55 = !DILocation(line: 39, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 39, column: 9)
!57 = !DILocation(line: 39, column: 25, scope: !56)
!58 = !DILocation(line: 39, column: 23, scope: !56)
!59 = !DILocation(line: 39, column: 9, scope: !53)
!60 = !DILocation(line: 41, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !12, line: 40, column: 9)
!62 = !DILocation(line: 41, column: 28, scope: !61)
!63 = !DILocation(line: 41, column: 18, scope: !61)
!64 = !DILocation(line: 41, column: 13, scope: !61)
!65 = !DILocation(line: 41, column: 21, scope: !61)
!66 = !DILocation(line: 42, column: 9, scope: !61)
!67 = !DILocation(line: 39, column: 35, scope: !56)
!68 = !DILocation(line: 39, column: 9, scope: !56)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 42, column: 9, scope: !53)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 43, column: 9, scope: !37)
!73 = !DILocation(line: 43, column: 20, scope: !37)
!74 = !DILocation(line: 44, column: 19, scope: !37)
!75 = !DILocation(line: 44, column: 9, scope: !37)
!76 = !DILocation(line: 46, column: 1, scope: !11)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_14_good", scope: !12, file: !12, line: 109, type: !13, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 111, column: 5, scope: !77)
!79 = !DILocation(line: 112, column: 5, scope: !77)
!80 = !DILocation(line: 113, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 125, type: !82, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 125, type: !84)
!87 = !DILocation(line: 125, column: 14, scope: !81)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 125, type: !85)
!89 = !DILocation(line: 125, column: 27, scope: !81)
!90 = !DILocation(line: 128, column: 22, scope: !81)
!91 = !DILocation(line: 128, column: 12, scope: !81)
!92 = !DILocation(line: 128, column: 5, scope: !81)
!93 = !DILocation(line: 130, column: 5, scope: !81)
!94 = !DILocation(line: 131, column: 5, scope: !81)
!95 = !DILocation(line: 132, column: 5, scope: !81)
!96 = !DILocation(line: 135, column: 5, scope: !81)
!97 = !DILocation(line: 136, column: 5, scope: !81)
!98 = !DILocation(line: 137, column: 5, scope: !81)
!99 = !DILocation(line: 139, column: 5, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 55, type: !16)
!102 = !DILocation(line: 55, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !12, line: 56, type: !20)
!104 = !DILocation(line: 56, column: 10, scope: !100)
!105 = !DILocation(line: 57, column: 12, scope: !100)
!106 = !DILocation(line: 57, column: 10, scope: !100)
!107 = !DILocation(line: 58, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !12, line: 58, column: 8)
!109 = !DILocation(line: 58, column: 18, scope: !108)
!110 = !DILocation(line: 58, column: 8, scope: !100)
!111 = !DILocation(line: 61, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !12, line: 59, column: 5)
!113 = !DILocation(line: 62, column: 5, scope: !112)
!114 = !DILocation(line: 66, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !12, line: 64, column: 5)
!116 = !DILocation(line: 66, column: 9, scope: !115)
!117 = !DILocation(line: 67, column: 9, scope: !115)
!118 = !DILocation(line: 67, column: 20, scope: !115)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !12, line: 70, type: !38)
!120 = distinct !DILexicalBlock(scope: !100, file: !12, line: 69, column: 5)
!121 = !DILocation(line: 70, column: 14, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !120, file: !12, line: 71, type: !43)
!123 = !DILocation(line: 71, column: 16, scope: !120)
!124 = !DILocalVariable(name: "dataLen", scope: !120, file: !12, line: 71, type: !43)
!125 = !DILocation(line: 71, column: 19, scope: !120)
!126 = !DILocation(line: 72, column: 26, scope: !120)
!127 = !DILocation(line: 72, column: 19, scope: !120)
!128 = !DILocation(line: 72, column: 17, scope: !120)
!129 = !DILocation(line: 74, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !120, file: !12, line: 74, column: 9)
!131 = !DILocation(line: 74, column: 14, scope: !130)
!132 = !DILocation(line: 74, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 74, column: 9)
!134 = !DILocation(line: 74, column: 25, scope: !133)
!135 = !DILocation(line: 74, column: 23, scope: !133)
!136 = !DILocation(line: 74, column: 9, scope: !130)
!137 = !DILocation(line: 76, column: 23, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !12, line: 75, column: 9)
!139 = !DILocation(line: 76, column: 28, scope: !138)
!140 = !DILocation(line: 76, column: 18, scope: !138)
!141 = !DILocation(line: 76, column: 13, scope: !138)
!142 = !DILocation(line: 76, column: 21, scope: !138)
!143 = !DILocation(line: 77, column: 9, scope: !138)
!144 = !DILocation(line: 74, column: 35, scope: !133)
!145 = !DILocation(line: 74, column: 9, scope: !133)
!146 = distinct !{!146, !136, !147, !71}
!147 = !DILocation(line: 77, column: 9, scope: !130)
!148 = !DILocation(line: 78, column: 9, scope: !120)
!149 = !DILocation(line: 78, column: 20, scope: !120)
!150 = !DILocation(line: 79, column: 19, scope: !120)
!151 = !DILocation(line: 79, column: 9, scope: !120)
!152 = !DILocation(line: 81, column: 1, scope: !100)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !12, line: 86, type: !16)
!155 = !DILocation(line: 86, column: 12, scope: !153)
!156 = !DILocalVariable(name: "dataBuffer", scope: !153, file: !12, line: 87, type: !20)
!157 = !DILocation(line: 87, column: 10, scope: !153)
!158 = !DILocation(line: 88, column: 12, scope: !153)
!159 = !DILocation(line: 88, column: 10, scope: !153)
!160 = !DILocation(line: 89, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !153, file: !12, line: 89, column: 8)
!162 = !DILocation(line: 89, column: 18, scope: !161)
!163 = !DILocation(line: 89, column: 8, scope: !153)
!164 = !DILocation(line: 92, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 90, column: 5)
!166 = !DILocation(line: 92, column: 9, scope: !165)
!167 = !DILocation(line: 93, column: 9, scope: !165)
!168 = !DILocation(line: 93, column: 20, scope: !165)
!169 = !DILocation(line: 94, column: 5, scope: !165)
!170 = !DILocalVariable(name: "dest", scope: !171, file: !12, line: 96, type: !38)
!171 = distinct !DILexicalBlock(scope: !153, file: !12, line: 95, column: 5)
!172 = !DILocation(line: 96, column: 14, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !171, file: !12, line: 97, type: !43)
!174 = !DILocation(line: 97, column: 16, scope: !171)
!175 = !DILocalVariable(name: "dataLen", scope: !171, file: !12, line: 97, type: !43)
!176 = !DILocation(line: 97, column: 19, scope: !171)
!177 = !DILocation(line: 98, column: 26, scope: !171)
!178 = !DILocation(line: 98, column: 19, scope: !171)
!179 = !DILocation(line: 98, column: 17, scope: !171)
!180 = !DILocation(line: 100, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !12, line: 100, column: 9)
!182 = !DILocation(line: 100, column: 14, scope: !181)
!183 = !DILocation(line: 100, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !12, line: 100, column: 9)
!185 = !DILocation(line: 100, column: 25, scope: !184)
!186 = !DILocation(line: 100, column: 23, scope: !184)
!187 = !DILocation(line: 100, column: 9, scope: !181)
!188 = !DILocation(line: 102, column: 23, scope: !189)
!189 = distinct !DILexicalBlock(scope: !184, file: !12, line: 101, column: 9)
!190 = !DILocation(line: 102, column: 28, scope: !189)
!191 = !DILocation(line: 102, column: 18, scope: !189)
!192 = !DILocation(line: 102, column: 13, scope: !189)
!193 = !DILocation(line: 102, column: 21, scope: !189)
!194 = !DILocation(line: 103, column: 9, scope: !189)
!195 = !DILocation(line: 100, column: 35, scope: !184)
!196 = !DILocation(line: 100, column: 9, scope: !184)
!197 = distinct !{!197, !187, !198, !71}
!198 = !DILocation(line: 103, column: 9, scope: !181)
!199 = !DILocation(line: 104, column: 9, scope: !171)
!200 = !DILocation(line: 104, column: 20, scope: !171)
!201 = !DILocation(line: 105, column: 19, scope: !171)
!202 = !DILocation(line: 105, column: 9, scope: !171)
!203 = !DILocation(line: 107, column: 1, scope: !153)
