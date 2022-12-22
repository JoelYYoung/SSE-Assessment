; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i2 = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !23
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !34
  %cmp1 = icmp slt i32 %1, 1, !dbg !36
  br i1 %cmp1, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %4, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !55, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !60, metadata !DIExpression()), !dbg !61
  %6 = load i8*, i8** %data, align 8, !dbg !62
  %call3 = call i64 @strlen(i8* %6) #9, !dbg !63
  store i64 %call3, i64* %dataLen, align 8, !dbg !64
  store i64 0, i64* %i2, align 8, !dbg !65
  br label %for.cond4, !dbg !67

for.cond4:                                        ; preds = %for.inc9, %for.end
  %7 = load i64, i64* %i2, align 8, !dbg !68
  %8 = load i64, i64* %dataLen, align 8, !dbg !70
  %cmp5 = icmp ult i64 %7, %8, !dbg !71
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !72

for.body6:                                        ; preds = %for.cond4
  %9 = load i8*, i8** %data, align 8, !dbg !73
  %10 = load i64, i64* %i2, align 8, !dbg !75
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !73
  %11 = load i8, i8* %arrayidx7, align 1, !dbg !73
  %12 = load i64, i64* %i2, align 8, !dbg !76
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !77
  store i8 %11, i8* %arrayidx8, align 1, !dbg !78
  br label %for.inc9, !dbg !79

for.inc9:                                         ; preds = %for.body6
  %13 = load i64, i64* %i2, align 8, !dbg !80
  %inc10 = add i64 %13, 1, !dbg !80
  store i64 %inc10, i64* %i2, align 8, !dbg !80
  br label %for.cond4, !dbg !81, !llvm.loop !82

for.end11:                                        ; preds = %for.cond4
  %arrayidx12 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !84
  store i8 0, i8* %arrayidx12, align 1, !dbg !85
  %14 = load i8*, i8** %data, align 8, !dbg !86
  call void @printLine(i8* %14), !dbg !87
  %15 = load i8*, i8** %data, align 8, !dbg !88
  call void @free(i8* %15) #7, !dbg !89
  ret void, !dbg !90
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_17_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #7, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #7, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_17_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_17_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i8** %data, metadata !115, metadata !DIExpression()), !dbg !116
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !117
  store i8* %call, i8** %data, align 8, !dbg !118
  %0 = load i8*, i8** %data, align 8, !dbg !119
  %cmp = icmp eq i8* %0, null, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %entry
  store i32 0, i32* %h, align 4, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %h, align 4, !dbg !128
  %cmp1 = icmp slt i32 %1, 1, !dbg !130
  br i1 %cmp1, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !134
  %3 = load i8*, i8** %data, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !135
  store i8 0, i8* %arrayidx, align 1, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %h, align 4, !dbg !138
  %inc = add nsw i32 %4, 1, !dbg !138
  store i32 %inc, i32* %h, align 4, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !147, metadata !DIExpression()), !dbg !148
  %6 = load i8*, i8** %data, align 8, !dbg !149
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !150
  store i64 %call2, i64* %dataLen, align 8, !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond3, !dbg !154

for.cond3:                                        ; preds = %for.inc8, %for.end
  %7 = load i64, i64* %i, align 8, !dbg !155
  %8 = load i64, i64* %dataLen, align 8, !dbg !157
  %cmp4 = icmp ult i64 %7, %8, !dbg !158
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !159

for.body5:                                        ; preds = %for.cond3
  %9 = load i8*, i8** %data, align 8, !dbg !160
  %10 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !160
  %11 = load i8, i8* %arrayidx6, align 1, !dbg !160
  %12 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !164
  store i8 %11, i8* %arrayidx7, align 1, !dbg !165
  br label %for.inc8, !dbg !166

for.inc8:                                         ; preds = %for.body5
  %13 = load i64, i64* %i, align 8, !dbg !167
  %inc9 = add i64 %13, 1, !dbg !167
  store i64 %inc9, i64* %i, align 8, !dbg !167
  br label %for.cond3, !dbg !168, !llvm.loop !169

for.end10:                                        ; preds = %for.cond3
  %arrayidx11 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !171
  store i8 0, i8* %arrayidx11, align 1, !dbg !172
  %14 = load i8*, i8** %data, align 8, !dbg !173
  call void @printLine(i8* %14), !dbg !174
  %15 = load i8*, i8** %data, align 8, !dbg !175
  call void @free(i8* %15) #7, !dbg !176
  ret void, !dbg !177
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_17.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_17_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_17.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 25, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 27, column: 20, scope: !14)
!24 = !DILocation(line: 27, column: 10, scope: !14)
!25 = !DILocation(line: 28, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 9)
!27 = !DILocation(line: 28, column: 14, scope: !26)
!28 = !DILocation(line: 28, column: 9, scope: !14)
!29 = !DILocation(line: 28, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 28, column: 23)
!31 = !DILocation(line: 29, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!33 = !DILocation(line: 29, column: 9, scope: !32)
!34 = !DILocation(line: 29, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !15, line: 29, column: 5)
!36 = !DILocation(line: 29, column: 18, scope: !35)
!37 = !DILocation(line: 29, column: 5, scope: !32)
!38 = !DILocation(line: 32, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 30, column: 5)
!40 = !DILocation(line: 32, column: 9, scope: !39)
!41 = !DILocation(line: 33, column: 9, scope: !39)
!42 = !DILocation(line: 33, column: 21, scope: !39)
!43 = !DILocation(line: 34, column: 5, scope: !39)
!44 = !DILocation(line: 29, column: 24, scope: !35)
!45 = !DILocation(line: 29, column: 5, scope: !35)
!46 = distinct !{!46, !37, !47, !48}
!47 = !DILocation(line: 34, column: 5, scope: !32)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocalVariable(name: "dest", scope: !50, file: !15, line: 36, type: !51)
!50 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 50)
!54 = !DILocation(line: 36, column: 14, scope: !50)
!55 = !DILocalVariable(name: "i", scope: !50, file: !15, line: 37, type: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 46, baseType: !58)
!57 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 37, column: 16, scope: !50)
!60 = !DILocalVariable(name: "dataLen", scope: !50, file: !15, line: 37, type: !56)
!61 = !DILocation(line: 37, column: 19, scope: !50)
!62 = !DILocation(line: 38, column: 26, scope: !50)
!63 = !DILocation(line: 38, column: 19, scope: !50)
!64 = !DILocation(line: 38, column: 17, scope: !50)
!65 = !DILocation(line: 40, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !50, file: !15, line: 40, column: 9)
!67 = !DILocation(line: 40, column: 14, scope: !66)
!68 = !DILocation(line: 40, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !15, line: 40, column: 9)
!70 = !DILocation(line: 40, column: 25, scope: !69)
!71 = !DILocation(line: 40, column: 23, scope: !69)
!72 = !DILocation(line: 40, column: 9, scope: !66)
!73 = !DILocation(line: 42, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !15, line: 41, column: 9)
!75 = !DILocation(line: 42, column: 28, scope: !74)
!76 = !DILocation(line: 42, column: 18, scope: !74)
!77 = !DILocation(line: 42, column: 13, scope: !74)
!78 = !DILocation(line: 42, column: 21, scope: !74)
!79 = !DILocation(line: 43, column: 9, scope: !74)
!80 = !DILocation(line: 40, column: 35, scope: !69)
!81 = !DILocation(line: 40, column: 9, scope: !69)
!82 = distinct !{!82, !72, !83, !48}
!83 = !DILocation(line: 43, column: 9, scope: !66)
!84 = !DILocation(line: 44, column: 9, scope: !50)
!85 = !DILocation(line: 44, column: 20, scope: !50)
!86 = !DILocation(line: 45, column: 19, scope: !50)
!87 = !DILocation(line: 45, column: 9, scope: !50)
!88 = !DILocation(line: 46, column: 14, scope: !50)
!89 = !DILocation(line: 46, column: 9, scope: !50)
!90 = !DILocation(line: 48, column: 1, scope: !14)
!91 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_17_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 84, column: 5, scope: !91)
!93 = !DILocation(line: 85, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 97, type: !95, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!19, !19, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !15, line: 97, type: !19)
!99 = !DILocation(line: 97, column: 14, scope: !94)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !15, line: 97, type: !97)
!101 = !DILocation(line: 97, column: 27, scope: !94)
!102 = !DILocation(line: 100, column: 22, scope: !94)
!103 = !DILocation(line: 100, column: 12, scope: !94)
!104 = !DILocation(line: 100, column: 5, scope: !94)
!105 = !DILocation(line: 102, column: 5, scope: !94)
!106 = !DILocation(line: 103, column: 5, scope: !94)
!107 = !DILocation(line: 104, column: 5, scope: !94)
!108 = !DILocation(line: 107, column: 5, scope: !94)
!109 = !DILocation(line: 108, column: 5, scope: !94)
!110 = !DILocation(line: 109, column: 5, scope: !94)
!111 = !DILocation(line: 111, column: 5, scope: !94)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "h", scope: !112, file: !15, line: 57, type: !19)
!114 = !DILocation(line: 57, column: 9, scope: !112)
!115 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 58, type: !4)
!116 = !DILocation(line: 58, column: 12, scope: !112)
!117 = !DILocation(line: 59, column: 20, scope: !112)
!118 = !DILocation(line: 59, column: 10, scope: !112)
!119 = !DILocation(line: 60, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !112, file: !15, line: 60, column: 9)
!121 = !DILocation(line: 60, column: 14, scope: !120)
!122 = !DILocation(line: 60, column: 9, scope: !112)
!123 = !DILocation(line: 60, column: 24, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 60, column: 23)
!125 = !DILocation(line: 61, column: 11, scope: !126)
!126 = distinct !DILexicalBlock(scope: !112, file: !15, line: 61, column: 5)
!127 = !DILocation(line: 61, column: 9, scope: !126)
!128 = !DILocation(line: 61, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !15, line: 61, column: 5)
!130 = !DILocation(line: 61, column: 18, scope: !129)
!131 = !DILocation(line: 61, column: 5, scope: !126)
!132 = !DILocation(line: 64, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 62, column: 5)
!134 = !DILocation(line: 64, column: 9, scope: !133)
!135 = !DILocation(line: 65, column: 9, scope: !133)
!136 = !DILocation(line: 65, column: 20, scope: !133)
!137 = !DILocation(line: 66, column: 5, scope: !133)
!138 = !DILocation(line: 61, column: 24, scope: !129)
!139 = !DILocation(line: 61, column: 5, scope: !129)
!140 = distinct !{!140, !131, !141, !48}
!141 = !DILocation(line: 66, column: 5, scope: !126)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !15, line: 68, type: !51)
!143 = distinct !DILexicalBlock(scope: !112, file: !15, line: 67, column: 5)
!144 = !DILocation(line: 68, column: 14, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !143, file: !15, line: 69, type: !56)
!146 = !DILocation(line: 69, column: 16, scope: !143)
!147 = !DILocalVariable(name: "dataLen", scope: !143, file: !15, line: 69, type: !56)
!148 = !DILocation(line: 69, column: 19, scope: !143)
!149 = !DILocation(line: 70, column: 26, scope: !143)
!150 = !DILocation(line: 70, column: 19, scope: !143)
!151 = !DILocation(line: 70, column: 17, scope: !143)
!152 = !DILocation(line: 72, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !143, file: !15, line: 72, column: 9)
!154 = !DILocation(line: 72, column: 14, scope: !153)
!155 = !DILocation(line: 72, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !15, line: 72, column: 9)
!157 = !DILocation(line: 72, column: 25, scope: !156)
!158 = !DILocation(line: 72, column: 23, scope: !156)
!159 = !DILocation(line: 72, column: 9, scope: !153)
!160 = !DILocation(line: 74, column: 23, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !15, line: 73, column: 9)
!162 = !DILocation(line: 74, column: 28, scope: !161)
!163 = !DILocation(line: 74, column: 18, scope: !161)
!164 = !DILocation(line: 74, column: 13, scope: !161)
!165 = !DILocation(line: 74, column: 21, scope: !161)
!166 = !DILocation(line: 75, column: 9, scope: !161)
!167 = !DILocation(line: 72, column: 35, scope: !156)
!168 = !DILocation(line: 72, column: 9, scope: !156)
!169 = distinct !{!169, !159, !170, !48}
!170 = !DILocation(line: 75, column: 9, scope: !153)
!171 = !DILocation(line: 76, column: 9, scope: !143)
!172 = !DILocation(line: 76, column: 20, scope: !143)
!173 = !DILocation(line: 77, column: 19, scope: !143)
!174 = !DILocation(line: 77, column: 9, scope: !143)
!175 = !DILocation(line: 78, column: 14, scope: !143)
!176 = !DILocation(line: 78, column: 9, scope: !143)
!177 = !DILocation(line: 80, column: 1, scope: !112)
