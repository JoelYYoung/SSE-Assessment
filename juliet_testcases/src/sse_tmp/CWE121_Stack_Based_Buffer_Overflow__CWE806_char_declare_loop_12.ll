; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_12_bad() #0 !dbg !11 {
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
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 49, !dbg !38
  store i8 0, i8* %arrayidx1, align 1, !dbg !39
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !52
  %5 = load i8*, i8** %data, align 8, !dbg !53
  %call2 = call i64 @strlen(i8* %5) #6, !dbg !54
  store i64 %call2, i64* %dataLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !59
  %7 = load i64, i64* %dataLen, align 8, !dbg !61
  %cmp = icmp ult i64 %6, %7, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !64
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !64
  %10 = load i8, i8* %arrayidx3, align 1, !dbg !64
  %11 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !68
  store i8 %10, i8* %arrayidx4, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %12, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !76
  store i8 0, i8* %arrayidx5, align 1, !dbg !77
  %13 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* %13), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_12_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_12_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_12_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i8* %arraydecay, i8** %data, align 8, !dbg !109
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !115
  %1 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !121
  %3 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 49, !dbg !122
  store i8 0, i8* %arrayidx1, align 1, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !129, metadata !DIExpression()), !dbg !130
  %5 = load i8*, i8** %data, align 8, !dbg !131
  %call2 = call i64 @strlen(i8* %5) #6, !dbg !132
  store i64 %call2, i64* %dataLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !137
  %7 = load i64, i64* %dataLen, align 8, !dbg !139
  %cmp = icmp ult i64 %6, %7, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !142
  %9 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !142
  %10 = load i8, i8* %arrayidx3, align 1, !dbg !142
  %11 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !146
  store i8 %10, i8* %arrayidx4, align 1, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %12, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !153
  store i8 0, i8* %arrayidx5, align 1, !dbg !154
  %13 = load i8*, i8** %data, align 8, !dbg !155
  call void @printLine(i8* %13), !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!28 = !DILocation(line: 28, column: 8, scope: !11)
!29 = !DILocation(line: 31, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !12, line: 29, column: 5)
!31 = !DILocation(line: 31, column: 9, scope: !30)
!32 = !DILocation(line: 32, column: 9, scope: !30)
!33 = !DILocation(line: 32, column: 21, scope: !30)
!34 = !DILocation(line: 33, column: 5, scope: !30)
!35 = !DILocation(line: 37, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !27, file: !12, line: 35, column: 5)
!37 = !DILocation(line: 37, column: 9, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 20, scope: !36)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 14, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 42, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 42, column: 16, scope: !41)
!51 = !DILocalVariable(name: "dataLen", scope: !41, file: !12, line: 42, type: !47)
!52 = !DILocation(line: 42, column: 19, scope: !41)
!53 = !DILocation(line: 43, column: 26, scope: !41)
!54 = !DILocation(line: 43, column: 19, scope: !41)
!55 = !DILocation(line: 43, column: 17, scope: !41)
!56 = !DILocation(line: 45, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !41, file: !12, line: 45, column: 9)
!58 = !DILocation(line: 45, column: 14, scope: !57)
!59 = !DILocation(line: 45, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 45, column: 9)
!61 = !DILocation(line: 45, column: 25, scope: !60)
!62 = !DILocation(line: 45, column: 23, scope: !60)
!63 = !DILocation(line: 45, column: 9, scope: !57)
!64 = !DILocation(line: 47, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !12, line: 46, column: 9)
!66 = !DILocation(line: 47, column: 28, scope: !65)
!67 = !DILocation(line: 47, column: 18, scope: !65)
!68 = !DILocation(line: 47, column: 13, scope: !65)
!69 = !DILocation(line: 47, column: 21, scope: !65)
!70 = !DILocation(line: 48, column: 9, scope: !65)
!71 = !DILocation(line: 45, column: 35, scope: !60)
!72 = !DILocation(line: 45, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 48, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 49, column: 9, scope: !41)
!77 = !DILocation(line: 49, column: 20, scope: !41)
!78 = !DILocation(line: 50, column: 19, scope: !41)
!79 = !DILocation(line: 50, column: 9, scope: !41)
!80 = !DILocation(line: 52, column: 1, scope: !11)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_12_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 93, column: 5, scope: !81)
!83 = !DILocation(line: 94, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !85, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 106, type: !87)
!90 = !DILocation(line: 106, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 106, type: !88)
!92 = !DILocation(line: 106, column: 27, scope: !84)
!93 = !DILocation(line: 109, column: 22, scope: !84)
!94 = !DILocation(line: 109, column: 12, scope: !84)
!95 = !DILocation(line: 109, column: 5, scope: !84)
!96 = !DILocation(line: 111, column: 5, scope: !84)
!97 = !DILocation(line: 112, column: 5, scope: !84)
!98 = !DILocation(line: 113, column: 5, scope: !84)
!99 = !DILocation(line: 116, column: 5, scope: !84)
!100 = !DILocation(line: 117, column: 5, scope: !84)
!101 = !DILocation(line: 118, column: 5, scope: !84)
!102 = !DILocation(line: 120, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 62, type: !16)
!105 = !DILocation(line: 62, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !12, line: 63, type: !20)
!107 = !DILocation(line: 63, column: 10, scope: !103)
!108 = !DILocation(line: 64, column: 12, scope: !103)
!109 = !DILocation(line: 64, column: 10, scope: !103)
!110 = !DILocation(line: 65, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !12, line: 65, column: 8)
!112 = !DILocation(line: 65, column: 8, scope: !103)
!113 = !DILocation(line: 68, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 66, column: 5)
!115 = !DILocation(line: 68, column: 9, scope: !114)
!116 = !DILocation(line: 69, column: 9, scope: !114)
!117 = !DILocation(line: 69, column: 20, scope: !114)
!118 = !DILocation(line: 70, column: 5, scope: !114)
!119 = !DILocation(line: 74, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !111, file: !12, line: 72, column: 5)
!121 = !DILocation(line: 74, column: 9, scope: !120)
!122 = !DILocation(line: 75, column: 9, scope: !120)
!123 = !DILocation(line: 75, column: 20, scope: !120)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !12, line: 78, type: !42)
!125 = distinct !DILexicalBlock(scope: !103, file: !12, line: 77, column: 5)
!126 = !DILocation(line: 78, column: 14, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !12, line: 79, type: !47)
!128 = !DILocation(line: 79, column: 16, scope: !125)
!129 = !DILocalVariable(name: "dataLen", scope: !125, file: !12, line: 79, type: !47)
!130 = !DILocation(line: 79, column: 19, scope: !125)
!131 = !DILocation(line: 80, column: 26, scope: !125)
!132 = !DILocation(line: 80, column: 19, scope: !125)
!133 = !DILocation(line: 80, column: 17, scope: !125)
!134 = !DILocation(line: 82, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !12, line: 82, column: 9)
!136 = !DILocation(line: 82, column: 14, scope: !135)
!137 = !DILocation(line: 82, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 82, column: 9)
!139 = !DILocation(line: 82, column: 25, scope: !138)
!140 = !DILocation(line: 82, column: 23, scope: !138)
!141 = !DILocation(line: 82, column: 9, scope: !135)
!142 = !DILocation(line: 84, column: 23, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !12, line: 83, column: 9)
!144 = !DILocation(line: 84, column: 28, scope: !143)
!145 = !DILocation(line: 84, column: 18, scope: !143)
!146 = !DILocation(line: 84, column: 13, scope: !143)
!147 = !DILocation(line: 84, column: 21, scope: !143)
!148 = !DILocation(line: 85, column: 9, scope: !143)
!149 = !DILocation(line: 82, column: 35, scope: !138)
!150 = !DILocation(line: 82, column: 9, scope: !138)
!151 = distinct !{!151, !141, !152, !75}
!152 = !DILocation(line: 85, column: 9, scope: !135)
!153 = !DILocation(line: 86, column: 9, scope: !125)
!154 = !DILocation(line: 86, column: 20, scope: !125)
!155 = !DILocation(line: 87, column: 19, scope: !125)
!156 = !DILocation(line: 87, column: 9, scope: !125)
!157 = !DILocation(line: 89, column: 1, scope: !103)
