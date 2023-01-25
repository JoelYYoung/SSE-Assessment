; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_03.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_03_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !45, metadata !DIExpression()), !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !48
  store i64 %call1, i64* %dataLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !53
  %6 = load i64, i64* %dataLen, align 8, !dbg !55
  %cmp2 = icmp ult i64 %5, %6, !dbg !56
  br i1 %cmp2, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !58
  %8 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !58
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !58
  %10 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !62
  store i8 %9, i8* %arrayidx4, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %11, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !70
  store i8 0, i8* %arrayidx5, align 1, !dbg !71
  %12 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %12), !dbg !73
  %13 = load i8*, i8** %data, align 8, !dbg !74
  call void @free(i8* %13) #7, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_03_good() #0 !dbg !77 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_03_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_03_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !103
  store i8* %call, i8** %data, align 8, !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  %cmp = icmp eq i8* %0, null, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !109
  unreachable, !dbg !109

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !114
  %2 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !122, metadata !DIExpression()), !dbg !123
  %4 = load i8*, i8** %data, align 8, !dbg !124
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !125
  store i64 %call1, i64* %dataLen, align 8, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !130
  %6 = load i64, i64* %dataLen, align 8, !dbg !132
  %cmp2 = icmp ult i64 %5, %6, !dbg !133
  br i1 %cmp2, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !135
  %8 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !135
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !135
  %10 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !139
  store i8 %9, i8* %arrayidx4, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %11, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !146
  store i8 0, i8* %arrayidx5, align 1, !dbg !147
  %12 = load i8*, i8** %data, align 8, !dbg !148
  call void @printLine(i8* %12), !dbg !149
  %13 = load i8*, i8** %data, align 8, !dbg !150
  call void @free(i8* %13) #7, !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !154, metadata !DIExpression()), !dbg !155
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !156
  store i8* %call, i8** %data, align 8, !dbg !157
  %0 = load i8*, i8** %data, align 8, !dbg !158
  %cmp = icmp eq i8* %0, null, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !162
  unreachable, !dbg !162

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !167
  %2 = load i8*, i8** %data, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !170, metadata !DIExpression()), !dbg !172
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !175, metadata !DIExpression()), !dbg !176
  %4 = load i8*, i8** %data, align 8, !dbg !177
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !178
  store i64 %call1, i64* %dataLen, align 8, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !183
  %6 = load i64, i64* %dataLen, align 8, !dbg !185
  %cmp2 = icmp ult i64 %5, %6, !dbg !186
  br i1 %cmp2, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !188
  %8 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !188
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !188
  %10 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !192
  store i8 %9, i8* %arrayidx4, align 1, !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !195
  %inc = add i64 %11, 1, !dbg !195
  store i64 %inc, i64* %i, align 8, !dbg !195
  br label %for.cond, !dbg !196, !llvm.loop !197

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !199
  store i8 0, i8* %arrayidx5, align 1, !dbg !200
  %12 = load i8*, i8** %data, align 8, !dbg !201
  call void @printLine(i8* %12), !dbg !202
  %13 = load i8*, i8** %data, align 8, !dbg !203
  call void @free(i8* %13) #7, !dbg !204
  ret void, !dbg !205
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_03.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_03_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_03.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 31, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !15, line: 29, column: 5)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 8)
!31 = !DILocation(line: 31, column: 9, scope: !29)
!32 = !DILocation(line: 32, column: 9, scope: !29)
!33 = !DILocation(line: 32, column: 21, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !15, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 35, column: 14, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !15, line: 36, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 36, column: 16, scope: !35)
!45 = !DILocalVariable(name: "dataLen", scope: !35, file: !15, line: 36, type: !41)
!46 = !DILocation(line: 36, column: 19, scope: !35)
!47 = !DILocation(line: 37, column: 26, scope: !35)
!48 = !DILocation(line: 37, column: 19, scope: !35)
!49 = !DILocation(line: 37, column: 17, scope: !35)
!50 = !DILocation(line: 39, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !35, file: !15, line: 39, column: 9)
!52 = !DILocation(line: 39, column: 14, scope: !51)
!53 = !DILocation(line: 39, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !15, line: 39, column: 9)
!55 = !DILocation(line: 39, column: 25, scope: !54)
!56 = !DILocation(line: 39, column: 23, scope: !54)
!57 = !DILocation(line: 39, column: 9, scope: !51)
!58 = !DILocation(line: 41, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !15, line: 40, column: 9)
!60 = !DILocation(line: 41, column: 28, scope: !59)
!61 = !DILocation(line: 41, column: 18, scope: !59)
!62 = !DILocation(line: 41, column: 13, scope: !59)
!63 = !DILocation(line: 41, column: 21, scope: !59)
!64 = !DILocation(line: 42, column: 9, scope: !59)
!65 = !DILocation(line: 39, column: 35, scope: !54)
!66 = !DILocation(line: 39, column: 9, scope: !54)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 42, column: 9, scope: !51)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 43, column: 9, scope: !35)
!71 = !DILocation(line: 43, column: 20, scope: !35)
!72 = !DILocation(line: 44, column: 19, scope: !35)
!73 = !DILocation(line: 44, column: 9, scope: !35)
!74 = !DILocation(line: 45, column: 14, scope: !35)
!75 = !DILocation(line: 45, column: 9, scope: !35)
!76 = !DILocation(line: 47, column: 1, scope: !14)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_03_good", scope: !15, file: !15, line: 112, type: !16, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 114, column: 5, scope: !77)
!79 = !DILocation(line: 115, column: 5, scope: !77)
!80 = !DILocation(line: 116, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 128, type: !82, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !15, line: 128, type: !84)
!87 = !DILocation(line: 128, column: 14, scope: !81)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !15, line: 128, type: !85)
!89 = !DILocation(line: 128, column: 27, scope: !81)
!90 = !DILocation(line: 131, column: 22, scope: !81)
!91 = !DILocation(line: 131, column: 12, scope: !81)
!92 = !DILocation(line: 131, column: 5, scope: !81)
!93 = !DILocation(line: 133, column: 5, scope: !81)
!94 = !DILocation(line: 134, column: 5, scope: !81)
!95 = !DILocation(line: 135, column: 5, scope: !81)
!96 = !DILocation(line: 138, column: 5, scope: !81)
!97 = !DILocation(line: 139, column: 5, scope: !81)
!98 = !DILocation(line: 140, column: 5, scope: !81)
!99 = !DILocation(line: 142, column: 5, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !15, line: 56, type: !4)
!102 = !DILocation(line: 56, column: 12, scope: !100)
!103 = !DILocation(line: 57, column: 20, scope: !100)
!104 = !DILocation(line: 57, column: 10, scope: !100)
!105 = !DILocation(line: 58, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !100, file: !15, line: 58, column: 9)
!107 = !DILocation(line: 58, column: 14, scope: !106)
!108 = !DILocation(line: 58, column: 9, scope: !100)
!109 = !DILocation(line: 58, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !15, line: 58, column: 23)
!111 = !DILocation(line: 67, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !15, line: 65, column: 5)
!113 = distinct !DILexicalBlock(scope: !100, file: !15, line: 59, column: 8)
!114 = !DILocation(line: 67, column: 9, scope: !112)
!115 = !DILocation(line: 68, column: 9, scope: !112)
!116 = !DILocation(line: 68, column: 20, scope: !112)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !15, line: 71, type: !36)
!118 = distinct !DILexicalBlock(scope: !100, file: !15, line: 70, column: 5)
!119 = !DILocation(line: 71, column: 14, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !118, file: !15, line: 72, type: !41)
!121 = !DILocation(line: 72, column: 16, scope: !118)
!122 = !DILocalVariable(name: "dataLen", scope: !118, file: !15, line: 72, type: !41)
!123 = !DILocation(line: 72, column: 19, scope: !118)
!124 = !DILocation(line: 73, column: 26, scope: !118)
!125 = !DILocation(line: 73, column: 19, scope: !118)
!126 = !DILocation(line: 73, column: 17, scope: !118)
!127 = !DILocation(line: 75, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !118, file: !15, line: 75, column: 9)
!129 = !DILocation(line: 75, column: 14, scope: !128)
!130 = !DILocation(line: 75, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !15, line: 75, column: 9)
!132 = !DILocation(line: 75, column: 25, scope: !131)
!133 = !DILocation(line: 75, column: 23, scope: !131)
!134 = !DILocation(line: 75, column: 9, scope: !128)
!135 = !DILocation(line: 77, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !15, line: 76, column: 9)
!137 = !DILocation(line: 77, column: 28, scope: !136)
!138 = !DILocation(line: 77, column: 18, scope: !136)
!139 = !DILocation(line: 77, column: 13, scope: !136)
!140 = !DILocation(line: 77, column: 21, scope: !136)
!141 = !DILocation(line: 78, column: 9, scope: !136)
!142 = !DILocation(line: 75, column: 35, scope: !131)
!143 = !DILocation(line: 75, column: 9, scope: !131)
!144 = distinct !{!144, !134, !145, !69}
!145 = !DILocation(line: 78, column: 9, scope: !128)
!146 = !DILocation(line: 79, column: 9, scope: !118)
!147 = !DILocation(line: 79, column: 20, scope: !118)
!148 = !DILocation(line: 80, column: 19, scope: !118)
!149 = !DILocation(line: 80, column: 9, scope: !118)
!150 = !DILocation(line: 81, column: 14, scope: !118)
!151 = !DILocation(line: 81, column: 9, scope: !118)
!152 = !DILocation(line: 83, column: 1, scope: !100)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !15, line: 88, type: !4)
!155 = !DILocation(line: 88, column: 12, scope: !153)
!156 = !DILocation(line: 89, column: 20, scope: !153)
!157 = !DILocation(line: 89, column: 10, scope: !153)
!158 = !DILocation(line: 90, column: 9, scope: !159)
!159 = distinct !DILexicalBlock(scope: !153, file: !15, line: 90, column: 9)
!160 = !DILocation(line: 90, column: 14, scope: !159)
!161 = !DILocation(line: 90, column: 9, scope: !153)
!162 = !DILocation(line: 90, column: 24, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !15, line: 90, column: 23)
!164 = !DILocation(line: 94, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !166, file: !15, line: 92, column: 5)
!166 = distinct !DILexicalBlock(scope: !153, file: !15, line: 91, column: 8)
!167 = !DILocation(line: 94, column: 9, scope: !165)
!168 = !DILocation(line: 95, column: 9, scope: !165)
!169 = !DILocation(line: 95, column: 20, scope: !165)
!170 = !DILocalVariable(name: "dest", scope: !171, file: !15, line: 98, type: !36)
!171 = distinct !DILexicalBlock(scope: !153, file: !15, line: 97, column: 5)
!172 = !DILocation(line: 98, column: 14, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !171, file: !15, line: 99, type: !41)
!174 = !DILocation(line: 99, column: 16, scope: !171)
!175 = !DILocalVariable(name: "dataLen", scope: !171, file: !15, line: 99, type: !41)
!176 = !DILocation(line: 99, column: 19, scope: !171)
!177 = !DILocation(line: 100, column: 26, scope: !171)
!178 = !DILocation(line: 100, column: 19, scope: !171)
!179 = !DILocation(line: 100, column: 17, scope: !171)
!180 = !DILocation(line: 102, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !15, line: 102, column: 9)
!182 = !DILocation(line: 102, column: 14, scope: !181)
!183 = !DILocation(line: 102, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !15, line: 102, column: 9)
!185 = !DILocation(line: 102, column: 25, scope: !184)
!186 = !DILocation(line: 102, column: 23, scope: !184)
!187 = !DILocation(line: 102, column: 9, scope: !181)
!188 = !DILocation(line: 104, column: 23, scope: !189)
!189 = distinct !DILexicalBlock(scope: !184, file: !15, line: 103, column: 9)
!190 = !DILocation(line: 104, column: 28, scope: !189)
!191 = !DILocation(line: 104, column: 18, scope: !189)
!192 = !DILocation(line: 104, column: 13, scope: !189)
!193 = !DILocation(line: 104, column: 21, scope: !189)
!194 = !DILocation(line: 105, column: 9, scope: !189)
!195 = !DILocation(line: 102, column: 35, scope: !184)
!196 = !DILocation(line: 102, column: 9, scope: !184)
!197 = distinct !{!197, !187, !198, !69}
!198 = !DILocation(line: 105, column: 9, scope: !181)
!199 = !DILocation(line: 106, column: 9, scope: !171)
!200 = !DILocation(line: 106, column: 20, scope: !171)
!201 = !DILocation(line: 107, column: 19, scope: !171)
!202 = !DILocation(line: 107, column: 9, scope: !171)
!203 = !DILocation(line: 108, column: 14, scope: !171)
!204 = !DILocation(line: 108, column: 9, scope: !171)
!205 = !DILocation(line: 110, column: 1, scope: !153)
