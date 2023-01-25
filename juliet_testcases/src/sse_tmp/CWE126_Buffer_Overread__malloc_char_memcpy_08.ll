; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %3, i64 %mul, i1 false), !dbg !47
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

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_08_good() #0 !dbg !59 {
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
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_08_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_08_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !82 {
entry:
  ret i32 1, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %call = call i32 @staticReturnsFalse(), !dbg !90
  %tobool = icmp ne i32 %call, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end3, !dbg !95

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !96
  store i8* %call1, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %cmp = icmp eq i8* %0, null, !dbg !101
  br i1 %cmp, label %if.then2, label %if.end, !dbg !102

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %data, align 8, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !106
  %2 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx4, align 1, !dbg !114
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !118
  %mul = mul i64 %call7, 1, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %3, i64 %mul, i1 false), !dbg !115
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx8, align 1, !dbg !121
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !122
  call void @printLine(i8* %arraydecay9), !dbg !123
  %4 = load i8*, i8** %data, align 8, !dbg !124
  call void @free(i8* %4) #8, !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !127 {
entry:
  ret i32 0, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !129 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !130, metadata !DIExpression()), !dbg !131
  store i8* null, i8** %data, align 8, !dbg !132
  %call = call i32 @staticReturnsTrue(), !dbg !133
  %tobool = icmp ne i32 %call, 0, !dbg !133
  br i1 %tobool, label %if.then, label %if.end3, !dbg !135

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !136
  store i8* %call1, i8** %data, align 8, !dbg !138
  %0 = load i8*, i8** %data, align 8, !dbg !139
  %cmp = icmp eq i8* %0, null, !dbg !141
  br i1 %cmp, label %if.then2, label %if.end, !dbg !142

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !146
  %2 = load i8*, i8** %data, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !147
  store i8 0, i8* %arrayidx, align 1, !dbg !148
  br label %if.end3, !dbg !149

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !150, metadata !DIExpression()), !dbg !152
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !153
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !154
  store i8 0, i8* %arrayidx4, align 1, !dbg !155
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !156
  %3 = load i8*, i8** %data, align 8, !dbg !157
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !158
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !159
  %mul = mul i64 %call7, 1, !dbg !160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %3, i64 %mul, i1 false), !dbg !156
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !161
  store i8 0, i8* %arrayidx8, align 1, !dbg !162
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !163
  call void @printLine(i8* %arraydecay9), !dbg !164
  %4 = load i8*, i8** %data, align 8, !dbg !165
  call void @free(i8* %4) #8, !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocation(line: 40, column: 10, scope: !14)
!21 = !DILocation(line: 41, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 8)
!23 = !DILocation(line: 41, column: 8, scope: !14)
!24 = !DILocation(line: 44, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 42, column: 5)
!26 = !DILocation(line: 44, column: 14, scope: !25)
!27 = !DILocation(line: 45, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 45, column: 13)
!29 = !DILocation(line: 45, column: 18, scope: !28)
!30 = !DILocation(line: 45, column: 13, scope: !25)
!31 = !DILocation(line: 45, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 45, column: 27)
!33 = !DILocation(line: 46, column: 16, scope: !25)
!34 = !DILocation(line: 46, column: 9, scope: !25)
!35 = !DILocation(line: 47, column: 9, scope: !25)
!36 = !DILocation(line: 47, column: 20, scope: !25)
!37 = !DILocation(line: 48, column: 5, scope: !25)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 50, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 49, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 50, column: 14, scope: !39)
!44 = !DILocation(line: 51, column: 9, scope: !39)
!45 = !DILocation(line: 52, column: 9, scope: !39)
!46 = !DILocation(line: 52, column: 21, scope: !39)
!47 = !DILocation(line: 55, column: 9, scope: !39)
!48 = !DILocation(line: 55, column: 22, scope: !39)
!49 = !DILocation(line: 55, column: 35, scope: !39)
!50 = !DILocation(line: 55, column: 28, scope: !39)
!51 = !DILocation(line: 55, column: 40, scope: !39)
!52 = !DILocation(line: 56, column: 9, scope: !39)
!53 = !DILocation(line: 56, column: 21, scope: !39)
!54 = !DILocation(line: 57, column: 19, scope: !39)
!55 = !DILocation(line: 57, column: 9, scope: !39)
!56 = !DILocation(line: 58, column: 14, scope: !39)
!57 = !DILocation(line: 58, column: 9, scope: !39)
!58 = !DILocation(line: 60, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_08_good", scope: !15, file: !15, line: 123, type: !16, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 125, column: 5, scope: !59)
!61 = !DILocation(line: 126, column: 5, scope: !59)
!62 = !DILocation(line: 127, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 139, type: !64, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 139, type: !66)
!69 = !DILocation(line: 139, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 139, type: !67)
!71 = !DILocation(line: 139, column: 27, scope: !63)
!72 = !DILocation(line: 142, column: 22, scope: !63)
!73 = !DILocation(line: 142, column: 12, scope: !63)
!74 = !DILocation(line: 142, column: 5, scope: !63)
!75 = !DILocation(line: 144, column: 5, scope: !63)
!76 = !DILocation(line: 145, column: 5, scope: !63)
!77 = !DILocation(line: 146, column: 5, scope: !63)
!78 = !DILocation(line: 149, column: 5, scope: !63)
!79 = !DILocation(line: 150, column: 5, scope: !63)
!80 = !DILocation(line: 151, column: 5, scope: !63)
!81 = !DILocation(line: 153, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !83, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!66}
!85 = !DILocation(line: 27, column: 5, scope: !82)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 67, type: !16, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 69, type: !4)
!88 = !DILocation(line: 69, column: 12, scope: !86)
!89 = !DILocation(line: 70, column: 10, scope: !86)
!90 = !DILocation(line: 71, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !15, line: 71, column: 8)
!92 = !DILocation(line: 71, column: 8, scope: !86)
!93 = !DILocation(line: 74, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !15, line: 72, column: 5)
!95 = !DILocation(line: 75, column: 5, scope: !94)
!96 = !DILocation(line: 79, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !15, line: 77, column: 5)
!98 = !DILocation(line: 79, column: 14, scope: !97)
!99 = !DILocation(line: 80, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !15, line: 80, column: 13)
!101 = !DILocation(line: 80, column: 18, scope: !100)
!102 = !DILocation(line: 80, column: 13, scope: !97)
!103 = !DILocation(line: 80, column: 28, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 80, column: 27)
!105 = !DILocation(line: 81, column: 16, scope: !97)
!106 = !DILocation(line: 81, column: 9, scope: !97)
!107 = !DILocation(line: 82, column: 9, scope: !97)
!108 = !DILocation(line: 82, column: 21, scope: !97)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !15, line: 85, type: !40)
!110 = distinct !DILexicalBlock(scope: !86, file: !15, line: 84, column: 5)
!111 = !DILocation(line: 85, column: 14, scope: !110)
!112 = !DILocation(line: 86, column: 9, scope: !110)
!113 = !DILocation(line: 87, column: 9, scope: !110)
!114 = !DILocation(line: 87, column: 21, scope: !110)
!115 = !DILocation(line: 90, column: 9, scope: !110)
!116 = !DILocation(line: 90, column: 22, scope: !110)
!117 = !DILocation(line: 90, column: 35, scope: !110)
!118 = !DILocation(line: 90, column: 28, scope: !110)
!119 = !DILocation(line: 90, column: 40, scope: !110)
!120 = !DILocation(line: 91, column: 9, scope: !110)
!121 = !DILocation(line: 91, column: 21, scope: !110)
!122 = !DILocation(line: 92, column: 19, scope: !110)
!123 = !DILocation(line: 92, column: 9, scope: !110)
!124 = !DILocation(line: 93, column: 14, scope: !110)
!125 = !DILocation(line: 93, column: 9, scope: !110)
!126 = !DILocation(line: 95, column: 1, scope: !86)
!127 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !83, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DILocation(line: 32, column: 5, scope: !127)
!129 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 98, type: !16, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !15, line: 100, type: !4)
!131 = !DILocation(line: 100, column: 12, scope: !129)
!132 = !DILocation(line: 101, column: 10, scope: !129)
!133 = !DILocation(line: 102, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !15, line: 102, column: 8)
!135 = !DILocation(line: 102, column: 8, scope: !129)
!136 = !DILocation(line: 105, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !15, line: 103, column: 5)
!138 = !DILocation(line: 105, column: 14, scope: !137)
!139 = !DILocation(line: 106, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 106, column: 13)
!141 = !DILocation(line: 106, column: 18, scope: !140)
!142 = !DILocation(line: 106, column: 13, scope: !137)
!143 = !DILocation(line: 106, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !15, line: 106, column: 27)
!145 = !DILocation(line: 107, column: 16, scope: !137)
!146 = !DILocation(line: 107, column: 9, scope: !137)
!147 = !DILocation(line: 108, column: 9, scope: !137)
!148 = !DILocation(line: 108, column: 21, scope: !137)
!149 = !DILocation(line: 109, column: 5, scope: !137)
!150 = !DILocalVariable(name: "dest", scope: !151, file: !15, line: 111, type: !40)
!151 = distinct !DILexicalBlock(scope: !129, file: !15, line: 110, column: 5)
!152 = !DILocation(line: 111, column: 14, scope: !151)
!153 = !DILocation(line: 112, column: 9, scope: !151)
!154 = !DILocation(line: 113, column: 9, scope: !151)
!155 = !DILocation(line: 113, column: 21, scope: !151)
!156 = !DILocation(line: 116, column: 9, scope: !151)
!157 = !DILocation(line: 116, column: 22, scope: !151)
!158 = !DILocation(line: 116, column: 35, scope: !151)
!159 = !DILocation(line: 116, column: 28, scope: !151)
!160 = !DILocation(line: 116, column: 40, scope: !151)
!161 = !DILocation(line: 117, column: 9, scope: !151)
!162 = !DILocation(line: 117, column: 21, scope: !151)
!163 = !DILocation(line: 118, column: 19, scope: !151)
!164 = !DILocation(line: 118, column: 9, scope: !151)
!165 = !DILocation(line: 119, column: 14, scope: !151)
!166 = !DILocation(line: 119, column: 9, scope: !151)
!167 = !DILocation(line: 121, column: 1, scope: !129)
