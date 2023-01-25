; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_11.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_11_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end3, !dbg !37

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx4, align 1, !dbg !46
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  %3 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !50
  %mul = mul i64 %call7, 1, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %3, i64 %mul, i1 false), !dbg !47
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx8, align 1, !dbg !53
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @printLine(i8* %arraydecay9), !dbg !55
  %4 = load i8*, i8** %data, align 8, !dbg !56
  call void @free(i8* %4) #8, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #7

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_11_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #8, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #8, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__malloc_char_memmove_11_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__malloc_char_memmove_11_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  %call = call i32 (...) @globalReturnsFalse(), !dbg !86
  %tobool = icmp ne i32 %call, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end3, !dbg !91

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !92
  store i8* %call1, i8** %data, align 8, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %cmp = icmp eq i8* %0, null, !dbg !97
  br i1 %cmp, label %if.then2, label %if.end, !dbg !98

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %data, align 8, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx4, align 1, !dbg !110
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  %3 = load i8*, i8** %data, align 8, !dbg !112
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !114
  %mul = mul i64 %call7, 1, !dbg !115
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %3, i64 %mul, i1 false), !dbg !111
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx8, align 1, !dbg !117
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  call void @printLine(i8* %arraydecay9), !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  call void @free(i8* %4) #8, !dbg !121
  ret void, !dbg !122
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i8* null, i8** %data, align 8, !dbg !126
  %call = call i32 (...) @globalReturnsTrue(), !dbg !127
  %tobool = icmp ne i32 %call, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end3, !dbg !129

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !130
  store i8* %call1, i8** %data, align 8, !dbg !132
  %0 = load i8*, i8** %data, align 8, !dbg !133
  %cmp = icmp eq i8* %0, null, !dbg !135
  br i1 %cmp, label %if.then2, label %if.end, !dbg !136

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !137
  unreachable, !dbg !137

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !140
  %2 = load i8*, i8** %data, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !141
  store i8 0, i8* %arrayidx, align 1, !dbg !142
  br label %if.end3, !dbg !143

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !144, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !147
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !148
  store i8 0, i8* %arrayidx4, align 1, !dbg !149
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  %3 = load i8*, i8** %data, align 8, !dbg !151
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !152
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !153
  %mul = mul i64 %call7, 1, !dbg !154
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %3, i64 %mul, i1 false), !dbg !150
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !155
  store i8 0, i8* %arrayidx8, align 1, !dbg !156
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  call void @printLine(i8* %arraydecay9), !dbg !158
  %4 = load i8*, i8** %data, align 8, !dbg !159
  call void @free(i8* %4) #8, !dbg !160
  ret void, !dbg !161
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nofree nounwind willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_11_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_11.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 14, scope: !25)
!27 = !DILocation(line: 31, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 13)
!29 = !DILocation(line: 31, column: 18, scope: !28)
!30 = !DILocation(line: 31, column: 13, scope: !25)
!31 = !DILocation(line: 31, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 27)
!33 = !DILocation(line: 32, column: 16, scope: !25)
!34 = !DILocation(line: 32, column: 9, scope: !25)
!35 = !DILocation(line: 33, column: 9, scope: !25)
!36 = !DILocation(line: 33, column: 20, scope: !25)
!37 = !DILocation(line: 34, column: 5, scope: !25)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 36, column: 14, scope: !39)
!44 = !DILocation(line: 37, column: 9, scope: !39)
!45 = !DILocation(line: 38, column: 9, scope: !39)
!46 = !DILocation(line: 38, column: 21, scope: !39)
!47 = !DILocation(line: 41, column: 9, scope: !39)
!48 = !DILocation(line: 41, column: 23, scope: !39)
!49 = !DILocation(line: 41, column: 36, scope: !39)
!50 = !DILocation(line: 41, column: 29, scope: !39)
!51 = !DILocation(line: 41, column: 41, scope: !39)
!52 = !DILocation(line: 42, column: 9, scope: !39)
!53 = !DILocation(line: 42, column: 21, scope: !39)
!54 = !DILocation(line: 43, column: 19, scope: !39)
!55 = !DILocation(line: 43, column: 9, scope: !39)
!56 = !DILocation(line: 44, column: 14, scope: !39)
!57 = !DILocation(line: 44, column: 9, scope: !39)
!58 = !DILocation(line: 46, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_11_good", scope: !15, file: !15, line: 109, type: !16, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 111, column: 5, scope: !59)
!61 = !DILocation(line: 112, column: 5, scope: !59)
!62 = !DILocation(line: 113, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 125, type: !64, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 125, type: !66)
!69 = !DILocation(line: 125, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 125, type: !67)
!71 = !DILocation(line: 125, column: 27, scope: !63)
!72 = !DILocation(line: 128, column: 22, scope: !63)
!73 = !DILocation(line: 128, column: 12, scope: !63)
!74 = !DILocation(line: 128, column: 5, scope: !63)
!75 = !DILocation(line: 130, column: 5, scope: !63)
!76 = !DILocation(line: 131, column: 5, scope: !63)
!77 = !DILocation(line: 132, column: 5, scope: !63)
!78 = !DILocation(line: 135, column: 5, scope: !63)
!79 = !DILocation(line: 136, column: 5, scope: !63)
!80 = !DILocation(line: 137, column: 5, scope: !63)
!81 = !DILocation(line: 139, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 53, type: !16, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 55, type: !4)
!84 = !DILocation(line: 55, column: 12, scope: !82)
!85 = !DILocation(line: 56, column: 10, scope: !82)
!86 = !DILocation(line: 57, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !15, line: 57, column: 8)
!88 = !DILocation(line: 57, column: 8, scope: !82)
!89 = !DILocation(line: 60, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 58, column: 5)
!91 = !DILocation(line: 61, column: 5, scope: !90)
!92 = !DILocation(line: 65, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !15, line: 63, column: 5)
!94 = !DILocation(line: 65, column: 14, scope: !93)
!95 = !DILocation(line: 66, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !15, line: 66, column: 13)
!97 = !DILocation(line: 66, column: 18, scope: !96)
!98 = !DILocation(line: 66, column: 13, scope: !93)
!99 = !DILocation(line: 66, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 66, column: 27)
!101 = !DILocation(line: 67, column: 16, scope: !93)
!102 = !DILocation(line: 67, column: 9, scope: !93)
!103 = !DILocation(line: 68, column: 9, scope: !93)
!104 = !DILocation(line: 68, column: 21, scope: !93)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !15, line: 71, type: !40)
!106 = distinct !DILexicalBlock(scope: !82, file: !15, line: 70, column: 5)
!107 = !DILocation(line: 71, column: 14, scope: !106)
!108 = !DILocation(line: 72, column: 9, scope: !106)
!109 = !DILocation(line: 73, column: 9, scope: !106)
!110 = !DILocation(line: 73, column: 21, scope: !106)
!111 = !DILocation(line: 76, column: 9, scope: !106)
!112 = !DILocation(line: 76, column: 23, scope: !106)
!113 = !DILocation(line: 76, column: 36, scope: !106)
!114 = !DILocation(line: 76, column: 29, scope: !106)
!115 = !DILocation(line: 76, column: 41, scope: !106)
!116 = !DILocation(line: 77, column: 9, scope: !106)
!117 = !DILocation(line: 77, column: 21, scope: !106)
!118 = !DILocation(line: 78, column: 19, scope: !106)
!119 = !DILocation(line: 78, column: 9, scope: !106)
!120 = !DILocation(line: 79, column: 14, scope: !106)
!121 = !DILocation(line: 79, column: 9, scope: !106)
!122 = !DILocation(line: 81, column: 1, scope: !82)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !15, line: 86, type: !4)
!125 = !DILocation(line: 86, column: 12, scope: !123)
!126 = !DILocation(line: 87, column: 10, scope: !123)
!127 = !DILocation(line: 88, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !15, line: 88, column: 8)
!129 = !DILocation(line: 88, column: 8, scope: !123)
!130 = !DILocation(line: 91, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !15, line: 89, column: 5)
!132 = !DILocation(line: 91, column: 14, scope: !131)
!133 = !DILocation(line: 92, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !15, line: 92, column: 13)
!135 = !DILocation(line: 92, column: 18, scope: !134)
!136 = !DILocation(line: 92, column: 13, scope: !131)
!137 = !DILocation(line: 92, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !15, line: 92, column: 27)
!139 = !DILocation(line: 93, column: 16, scope: !131)
!140 = !DILocation(line: 93, column: 9, scope: !131)
!141 = !DILocation(line: 94, column: 9, scope: !131)
!142 = !DILocation(line: 94, column: 21, scope: !131)
!143 = !DILocation(line: 95, column: 5, scope: !131)
!144 = !DILocalVariable(name: "dest", scope: !145, file: !15, line: 97, type: !40)
!145 = distinct !DILexicalBlock(scope: !123, file: !15, line: 96, column: 5)
!146 = !DILocation(line: 97, column: 14, scope: !145)
!147 = !DILocation(line: 98, column: 9, scope: !145)
!148 = !DILocation(line: 99, column: 9, scope: !145)
!149 = !DILocation(line: 99, column: 21, scope: !145)
!150 = !DILocation(line: 102, column: 9, scope: !145)
!151 = !DILocation(line: 102, column: 23, scope: !145)
!152 = !DILocation(line: 102, column: 36, scope: !145)
!153 = !DILocation(line: 102, column: 29, scope: !145)
!154 = !DILocation(line: 102, column: 41, scope: !145)
!155 = !DILocation(line: 103, column: 9, scope: !145)
!156 = !DILocation(line: 103, column: 21, scope: !145)
!157 = !DILocation(line: 104, column: 19, scope: !145)
!158 = !DILocation(line: 104, column: 9, scope: !145)
!159 = !DILocation(line: 105, column: 14, scope: !145)
!160 = !DILocation(line: 105, column: 9, scope: !145)
!161 = !DILocation(line: 107, column: 1, scope: !123)
