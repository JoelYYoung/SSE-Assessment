; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !33, metadata !DIExpression()), !dbg !35
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !36
  %2 = load i8*, i8** %1, align 8, !dbg !37
  store i8* %2, i8** %data1, align 8, !dbg !35
  %3 = load i8*, i8** %data1, align 8, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !39
  %4 = load i8*, i8** %data1, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %5 = load i8*, i8** %data1, align 8, !dbg !42
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !43
  store i8* %5, i8** %6, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !48
  %8 = load i8*, i8** %7, align 8, !dbg !49
  store i8* %8, i8** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %9 = bitcast [50 x i8]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 50, i1 false), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !61, metadata !DIExpression()), !dbg !62
  %10 = load i8*, i8** %data2, align 8, !dbg !63
  %call3 = call i64 @strlen(i8* %10) #9, !dbg !64
  store i64 %call3, i64* %dataLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i64, i64* %i, align 8, !dbg !69
  %12 = load i64, i64* %dataLen, align 8, !dbg !71
  %cmp4 = icmp ult i64 %11, %12, !dbg !72
  br i1 %cmp4, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** %data2, align 8, !dbg !74
  %14 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !74
  %15 = load i8, i8* %arrayidx5, align 1, !dbg !74
  %16 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %16, !dbg !78
  store i8 %15, i8* %arrayidx6, align 1, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %17, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !86
  store i8 0, i8* %arrayidx7, align 1, !dbg !87
  %18 = load i8*, i8** %data2, align 8, !dbg !88
  call void @printLine(i8* %18), !dbg !89
  %19 = load i8*, i8** %data2, align 8, !dbg !90
  call void @free(i8* %19) #7, !dbg !91
  ret void, !dbg !92
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_good() #0 !dbg !93 {
entry:
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #7, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #7, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !117, metadata !DIExpression()), !dbg !118
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !119, metadata !DIExpression()), !dbg !120
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !120
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !121
  store i8* %call, i8** %data, align 8, !dbg !122
  %0 = load i8*, i8** %data, align 8, !dbg !123
  %cmp = icmp eq i8* %0, null, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !129, metadata !DIExpression()), !dbg !131
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !132
  %2 = load i8*, i8** %1, align 8, !dbg !133
  store i8* %2, i8** %data1, align 8, !dbg !131
  %3 = load i8*, i8** %data1, align 8, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !135
  %4 = load i8*, i8** %data1, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !136
  store i8 0, i8* %arrayidx, align 1, !dbg !137
  %5 = load i8*, i8** %data1, align 8, !dbg !138
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !139
  store i8* %5, i8** %6, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !141, metadata !DIExpression()), !dbg !143
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !144
  %8 = load i8*, i8** %7, align 8, !dbg !145
  store i8* %8, i8** %data2, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !146, metadata !DIExpression()), !dbg !148
  %9 = bitcast [50 x i8]* %dest to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 50, i1 false), !dbg !148
  call void @llvm.dbg.declare(metadata i64* %i, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !151, metadata !DIExpression()), !dbg !152
  %10 = load i8*, i8** %data2, align 8, !dbg !153
  %call3 = call i64 @strlen(i8* %10) #9, !dbg !154
  store i64 %call3, i64* %dataLen, align 8, !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i64, i64* %i, align 8, !dbg !159
  %12 = load i64, i64* %dataLen, align 8, !dbg !161
  %cmp4 = icmp ult i64 %11, %12, !dbg !162
  br i1 %cmp4, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** %data2, align 8, !dbg !164
  %14 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx5 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !164
  %15 = load i8, i8* %arrayidx5, align 1, !dbg !164
  %16 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %16, !dbg !168
  store i8 %15, i8* %arrayidx6, align 1, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %17, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !175
  store i8 0, i8* %arrayidx7, align 1, !dbg !176
  %18 = load i8*, i8** %data2, align 8, !dbg !177
  call void @printLine(i8* %18), !dbg !178
  %19 = load i8*, i8** %data2, align 8, !dbg !179
  call void @free(i8* %19) #7, !dbg !180
  ret void, !dbg !181
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !14)
!25 = !DILocation(line: 28, column: 20, scope: !14)
!26 = !DILocation(line: 28, column: 10, scope: !14)
!27 = !DILocation(line: 29, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!29 = !DILocation(line: 29, column: 14, scope: !28)
!30 = !DILocation(line: 29, column: 9, scope: !14)
!31 = !DILocation(line: 29, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 29, column: 23)
!33 = !DILocalVariable(name: "data", scope: !34, file: !15, line: 31, type: !4)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!35 = !DILocation(line: 31, column: 16, scope: !34)
!36 = !DILocation(line: 31, column: 24, scope: !34)
!37 = !DILocation(line: 31, column: 23, scope: !34)
!38 = !DILocation(line: 33, column: 16, scope: !34)
!39 = !DILocation(line: 33, column: 9, scope: !34)
!40 = !DILocation(line: 34, column: 9, scope: !34)
!41 = !DILocation(line: 34, column: 21, scope: !34)
!42 = !DILocation(line: 35, column: 21, scope: !34)
!43 = !DILocation(line: 35, column: 10, scope: !34)
!44 = !DILocation(line: 35, column: 19, scope: !34)
!45 = !DILocalVariable(name: "data", scope: !46, file: !15, line: 38, type: !4)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 16, scope: !46)
!48 = !DILocation(line: 38, column: 24, scope: !46)
!49 = !DILocation(line: 38, column: 23, scope: !46)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !15, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 50)
!55 = !DILocation(line: 40, column: 18, scope: !51)
!56 = !DILocalVariable(name: "i", scope: !51, file: !15, line: 41, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !58, line: 46, baseType: !59)
!58 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!59 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 41, column: 20, scope: !51)
!61 = !DILocalVariable(name: "dataLen", scope: !51, file: !15, line: 41, type: !57)
!62 = !DILocation(line: 41, column: 23, scope: !51)
!63 = !DILocation(line: 42, column: 30, scope: !51)
!64 = !DILocation(line: 42, column: 23, scope: !51)
!65 = !DILocation(line: 42, column: 21, scope: !51)
!66 = !DILocation(line: 44, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !51, file: !15, line: 44, column: 13)
!68 = !DILocation(line: 44, column: 18, scope: !67)
!69 = !DILocation(line: 44, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !15, line: 44, column: 13)
!71 = !DILocation(line: 44, column: 29, scope: !70)
!72 = !DILocation(line: 44, column: 27, scope: !70)
!73 = !DILocation(line: 44, column: 13, scope: !67)
!74 = !DILocation(line: 46, column: 27, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !15, line: 45, column: 13)
!76 = !DILocation(line: 46, column: 32, scope: !75)
!77 = !DILocation(line: 46, column: 22, scope: !75)
!78 = !DILocation(line: 46, column: 17, scope: !75)
!79 = !DILocation(line: 46, column: 25, scope: !75)
!80 = !DILocation(line: 47, column: 13, scope: !75)
!81 = !DILocation(line: 44, column: 39, scope: !70)
!82 = !DILocation(line: 44, column: 13, scope: !70)
!83 = distinct !{!83, !73, !84, !85}
!84 = !DILocation(line: 47, column: 13, scope: !67)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 48, column: 13, scope: !51)
!87 = !DILocation(line: 48, column: 24, scope: !51)
!88 = !DILocation(line: 49, column: 23, scope: !51)
!89 = !DILocation(line: 49, column: 13, scope: !51)
!90 = !DILocation(line: 50, column: 18, scope: !51)
!91 = !DILocation(line: 50, column: 13, scope: !51)
!92 = !DILocation(line: 53, column: 1, scope: !14)
!93 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_good", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 94, column: 5, scope: !93)
!95 = !DILocation(line: 95, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 106, type: !97, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!99, !99, !21}
!99 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !15, line: 106, type: !99)
!101 = !DILocation(line: 106, column: 14, scope: !96)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !15, line: 106, type: !21)
!103 = !DILocation(line: 106, column: 27, scope: !96)
!104 = !DILocation(line: 109, column: 22, scope: !96)
!105 = !DILocation(line: 109, column: 12, scope: !96)
!106 = !DILocation(line: 109, column: 5, scope: !96)
!107 = !DILocation(line: 111, column: 5, scope: !96)
!108 = !DILocation(line: 112, column: 5, scope: !96)
!109 = !DILocation(line: 113, column: 5, scope: !96)
!110 = !DILocation(line: 116, column: 5, scope: !96)
!111 = !DILocation(line: 117, column: 5, scope: !96)
!112 = !DILocation(line: 118, column: 5, scope: !96)
!113 = !DILocation(line: 120, column: 5, scope: !96)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !15, line: 62, type: !4)
!116 = !DILocation(line: 62, column: 12, scope: !114)
!117 = !DILocalVariable(name: "dataPtr1", scope: !114, file: !15, line: 63, type: !21)
!118 = !DILocation(line: 63, column: 13, scope: !114)
!119 = !DILocalVariable(name: "dataPtr2", scope: !114, file: !15, line: 64, type: !21)
!120 = !DILocation(line: 64, column: 13, scope: !114)
!121 = !DILocation(line: 65, column: 20, scope: !114)
!122 = !DILocation(line: 65, column: 10, scope: !114)
!123 = !DILocation(line: 66, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !15, line: 66, column: 9)
!125 = !DILocation(line: 66, column: 14, scope: !124)
!126 = !DILocation(line: 66, column: 9, scope: !114)
!127 = !DILocation(line: 66, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 66, column: 23)
!129 = !DILocalVariable(name: "data", scope: !130, file: !15, line: 68, type: !4)
!130 = distinct !DILexicalBlock(scope: !114, file: !15, line: 67, column: 5)
!131 = !DILocation(line: 68, column: 16, scope: !130)
!132 = !DILocation(line: 68, column: 24, scope: !130)
!133 = !DILocation(line: 68, column: 23, scope: !130)
!134 = !DILocation(line: 70, column: 16, scope: !130)
!135 = !DILocation(line: 70, column: 9, scope: !130)
!136 = !DILocation(line: 71, column: 9, scope: !130)
!137 = !DILocation(line: 71, column: 20, scope: !130)
!138 = !DILocation(line: 72, column: 21, scope: !130)
!139 = !DILocation(line: 72, column: 10, scope: !130)
!140 = !DILocation(line: 72, column: 19, scope: !130)
!141 = !DILocalVariable(name: "data", scope: !142, file: !15, line: 75, type: !4)
!142 = distinct !DILexicalBlock(scope: !114, file: !15, line: 74, column: 5)
!143 = !DILocation(line: 75, column: 16, scope: !142)
!144 = !DILocation(line: 75, column: 24, scope: !142)
!145 = !DILocation(line: 75, column: 23, scope: !142)
!146 = !DILocalVariable(name: "dest", scope: !147, file: !15, line: 77, type: !52)
!147 = distinct !DILexicalBlock(scope: !142, file: !15, line: 76, column: 9)
!148 = !DILocation(line: 77, column: 18, scope: !147)
!149 = !DILocalVariable(name: "i", scope: !147, file: !15, line: 78, type: !57)
!150 = !DILocation(line: 78, column: 20, scope: !147)
!151 = !DILocalVariable(name: "dataLen", scope: !147, file: !15, line: 78, type: !57)
!152 = !DILocation(line: 78, column: 23, scope: !147)
!153 = !DILocation(line: 79, column: 30, scope: !147)
!154 = !DILocation(line: 79, column: 23, scope: !147)
!155 = !DILocation(line: 79, column: 21, scope: !147)
!156 = !DILocation(line: 81, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !147, file: !15, line: 81, column: 13)
!158 = !DILocation(line: 81, column: 18, scope: !157)
!159 = !DILocation(line: 81, column: 25, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !15, line: 81, column: 13)
!161 = !DILocation(line: 81, column: 29, scope: !160)
!162 = !DILocation(line: 81, column: 27, scope: !160)
!163 = !DILocation(line: 81, column: 13, scope: !157)
!164 = !DILocation(line: 83, column: 27, scope: !165)
!165 = distinct !DILexicalBlock(scope: !160, file: !15, line: 82, column: 13)
!166 = !DILocation(line: 83, column: 32, scope: !165)
!167 = !DILocation(line: 83, column: 22, scope: !165)
!168 = !DILocation(line: 83, column: 17, scope: !165)
!169 = !DILocation(line: 83, column: 25, scope: !165)
!170 = !DILocation(line: 84, column: 13, scope: !165)
!171 = !DILocation(line: 81, column: 39, scope: !160)
!172 = !DILocation(line: 81, column: 13, scope: !160)
!173 = distinct !{!173, !163, !174, !85}
!174 = !DILocation(line: 84, column: 13, scope: !157)
!175 = !DILocation(line: 85, column: 13, scope: !147)
!176 = !DILocation(line: 85, column: 24, scope: !147)
!177 = !DILocation(line: 86, column: 23, scope: !147)
!178 = !DILocation(line: 86, column: 13, scope: !147)
!179 = !DILocation(line: 87, column: 18, scope: !147)
!180 = !DILocation(line: 87, column: 13, scope: !147)
!181 = !DILocation(line: 90, column: 1, scope: !114)
