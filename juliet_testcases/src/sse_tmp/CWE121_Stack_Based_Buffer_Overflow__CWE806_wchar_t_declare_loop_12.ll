; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.else, !dbg !30

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !33
  %1 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end, !dbg !36

if.else:                                          ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %call2 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 49, !dbg !40
  store i32 0, i32* %arrayidx3, align 4, !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %call4 = call i64 @wcslen(i32* %5) #7, !dbg !55
  store i64 %call4, i64* %dataLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !60
  %7 = load i64, i64* %dataLen, align 8, !dbg !62
  %cmp = icmp ult i64 %6, %7, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !65
  %9 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !65
  %10 = load i32, i32* %arrayidx5, align 4, !dbg !65
  %11 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !69
  store i32 %10, i32* %arrayidx6, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %12, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !77
  store i32 0, i32* %arrayidx7, align 4, !dbg !78
  %13 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* %13), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_12_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #6, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #6, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_12_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_12_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay, i32** %data, align 8, !dbg !111
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !112
  %tobool = icmp ne i32 %call, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !115
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !121
  %call2 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !123
  %3 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 49, !dbg !124
  store i32 0, i32* %arrayidx3, align 4, !dbg !125
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !131, metadata !DIExpression()), !dbg !132
  %5 = load i32*, i32** %data, align 8, !dbg !133
  %call4 = call i64 @wcslen(i32* %5) #7, !dbg !134
  store i64 %call4, i64* %dataLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !139
  %7 = load i64, i64* %dataLen, align 8, !dbg !141
  %cmp = icmp ult i64 %6, %7, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !144
  %9 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !144
  %10 = load i32, i32* %arrayidx5, align 4, !dbg !144
  %11 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !148
  store i32 %10, i32* %arrayidx6, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %12, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !155
  store i32 0, i32* %arrayidx7, align 4, !dbg !156
  %13 = load i32*, i32** %data, align 8, !dbg !157
  call void @printWLine(i32* %13), !dbg !158
  ret void, !dbg !159
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 12, scope: !11)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 28, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!30 = !DILocation(line: 28, column: 8, scope: !11)
!31 = !DILocation(line: 31, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !12, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 9, scope: !32)
!35 = !DILocation(line: 32, column: 21, scope: !32)
!36 = !DILocation(line: 33, column: 5, scope: !32)
!37 = !DILocation(line: 37, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !12, line: 35, column: 5)
!39 = !DILocation(line: 37, column: 9, scope: !38)
!40 = !DILocation(line: 38, column: 9, scope: !38)
!41 = !DILocation(line: 38, column: 20, scope: !38)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !12, line: 41, type: !44)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 41, column: 17, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 42, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 42, column: 16, scope: !43)
!52 = !DILocalVariable(name: "dataLen", scope: !43, file: !12, line: 42, type: !49)
!53 = !DILocation(line: 42, column: 19, scope: !43)
!54 = !DILocation(line: 43, column: 26, scope: !43)
!55 = !DILocation(line: 43, column: 19, scope: !43)
!56 = !DILocation(line: 43, column: 17, scope: !43)
!57 = !DILocation(line: 45, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !43, file: !12, line: 45, column: 9)
!59 = !DILocation(line: 45, column: 14, scope: !58)
!60 = !DILocation(line: 45, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 45, column: 9)
!62 = !DILocation(line: 45, column: 25, scope: !61)
!63 = !DILocation(line: 45, column: 23, scope: !61)
!64 = !DILocation(line: 45, column: 9, scope: !58)
!65 = !DILocation(line: 47, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !12, line: 46, column: 9)
!67 = !DILocation(line: 47, column: 28, scope: !66)
!68 = !DILocation(line: 47, column: 18, scope: !66)
!69 = !DILocation(line: 47, column: 13, scope: !66)
!70 = !DILocation(line: 47, column: 21, scope: !66)
!71 = !DILocation(line: 48, column: 9, scope: !66)
!72 = !DILocation(line: 45, column: 35, scope: !61)
!73 = !DILocation(line: 45, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 48, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 49, column: 9, scope: !43)
!78 = !DILocation(line: 49, column: 20, scope: !43)
!79 = !DILocation(line: 50, column: 20, scope: !43)
!80 = !DILocation(line: 50, column: 9, scope: !43)
!81 = !DILocation(line: 52, column: 1, scope: !11)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_12_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 93, column: 5, scope: !82)
!84 = !DILocation(line: 94, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !86, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!19, !19, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 106, type: !19)
!92 = !DILocation(line: 106, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 106, type: !88)
!94 = !DILocation(line: 106, column: 27, scope: !85)
!95 = !DILocation(line: 109, column: 22, scope: !85)
!96 = !DILocation(line: 109, column: 12, scope: !85)
!97 = !DILocation(line: 109, column: 5, scope: !85)
!98 = !DILocation(line: 111, column: 5, scope: !85)
!99 = !DILocation(line: 112, column: 5, scope: !85)
!100 = !DILocation(line: 113, column: 5, scope: !85)
!101 = !DILocation(line: 116, column: 5, scope: !85)
!102 = !DILocation(line: 117, column: 5, scope: !85)
!103 = !DILocation(line: 118, column: 5, scope: !85)
!104 = !DILocation(line: 120, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 62, type: !16)
!107 = !DILocation(line: 62, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !12, line: 63, type: !22)
!109 = !DILocation(line: 63, column: 13, scope: !105)
!110 = !DILocation(line: 64, column: 12, scope: !105)
!111 = !DILocation(line: 64, column: 10, scope: !105)
!112 = !DILocation(line: 65, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !12, line: 65, column: 8)
!114 = !DILocation(line: 65, column: 8, scope: !105)
!115 = !DILocation(line: 68, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 66, column: 5)
!117 = !DILocation(line: 68, column: 9, scope: !116)
!118 = !DILocation(line: 69, column: 9, scope: !116)
!119 = !DILocation(line: 69, column: 20, scope: !116)
!120 = !DILocation(line: 70, column: 5, scope: !116)
!121 = !DILocation(line: 74, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !113, file: !12, line: 72, column: 5)
!123 = !DILocation(line: 74, column: 9, scope: !122)
!124 = !DILocation(line: 75, column: 9, scope: !122)
!125 = !DILocation(line: 75, column: 20, scope: !122)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !12, line: 78, type: !44)
!127 = distinct !DILexicalBlock(scope: !105, file: !12, line: 77, column: 5)
!128 = !DILocation(line: 78, column: 17, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !127, file: !12, line: 79, type: !49)
!130 = !DILocation(line: 79, column: 16, scope: !127)
!131 = !DILocalVariable(name: "dataLen", scope: !127, file: !12, line: 79, type: !49)
!132 = !DILocation(line: 79, column: 19, scope: !127)
!133 = !DILocation(line: 80, column: 26, scope: !127)
!134 = !DILocation(line: 80, column: 19, scope: !127)
!135 = !DILocation(line: 80, column: 17, scope: !127)
!136 = !DILocation(line: 82, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !12, line: 82, column: 9)
!138 = !DILocation(line: 82, column: 14, scope: !137)
!139 = !DILocation(line: 82, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 82, column: 9)
!141 = !DILocation(line: 82, column: 25, scope: !140)
!142 = !DILocation(line: 82, column: 23, scope: !140)
!143 = !DILocation(line: 82, column: 9, scope: !137)
!144 = !DILocation(line: 84, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !12, line: 83, column: 9)
!146 = !DILocation(line: 84, column: 28, scope: !145)
!147 = !DILocation(line: 84, column: 18, scope: !145)
!148 = !DILocation(line: 84, column: 13, scope: !145)
!149 = !DILocation(line: 84, column: 21, scope: !145)
!150 = !DILocation(line: 85, column: 9, scope: !145)
!151 = !DILocation(line: 82, column: 35, scope: !140)
!152 = !DILocation(line: 82, column: 9, scope: !140)
!153 = distinct !{!153, !143, !154, !76}
!154 = !DILocation(line: 85, column: 9, scope: !137)
!155 = !DILocation(line: 86, column: 9, scope: !127)
!156 = !DILocation(line: 86, column: 20, scope: !127)
!157 = !DILocation(line: 87, column: 20, scope: !127)
!158 = !DILocation(line: 87, column: 9, scope: !127)
!159 = !DILocation(line: 89, column: 1, scope: !105)
