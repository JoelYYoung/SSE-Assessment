; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memmove_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %call1 = call i32 @staticReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call1, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay2, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !42
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx5, align 4, !dbg !44
  %0 = load i32*, i32** %data, align 8, !dbg !45
  %1 = bitcast i32* %0 to i8*, !dbg !46
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %2 = bitcast i32* %arraydecay6 to i8*, !dbg !46
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %arrayidx7 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !47
  store i32 0, i32* %arrayidx7, align 4, !dbg !48
  %4 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %4), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memmove_08_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memmove_08_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memmove_08_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !76 {
entry:
  ret i32 1, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !85
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !86
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %call1 = call i32 @staticReturnsFalse(), !dbg !89
  %tobool = icmp ne i32 %call1, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !95
  store i32* %arraydecay2, i32** %data, align 8, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !101
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !102
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx5, align 4, !dbg !104
  %0 = load i32*, i32** %data, align 8, !dbg !105
  %1 = bitcast i32* %0 to i8*, !dbg !106
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %2 = bitcast i32* %arraydecay6 to i8*, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !106
  %3 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx7 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !107
  store i32 0, i32* %arrayidx7, align 4, !dbg !108
  %4 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* %4), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !112 {
entry:
  ret i32 0, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !119
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !120
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %call1 = call i32 @staticReturnsTrue(), !dbg !123
  %tobool = icmp ne i32 %call1, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !126
  store i32* %arraydecay2, i32** %data, align 8, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !134
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx5, align 4, !dbg !136
  %0 = load i32*, i32** %data, align 8, !dbg !137
  %1 = bitcast i32* %0 to i8*, !dbg !138
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !138
  %2 = bitcast i32* %arraydecay6 to i8*, !dbg !138
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !138
  %3 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx7 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !139
  store i32 0, i32* %arrayidx7, align 4, !dbg !140
  %4 = load i32*, i32** %data, align 8, !dbg !141
  call void @printWLine(i32* %4), !dbg !142
  ret void, !dbg !143
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memmove_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocation(line: 41, column: 13, scope: !11)
!27 = !DILocation(line: 41, column: 5, scope: !11)
!28 = !DILocation(line: 42, column: 5, scope: !11)
!29 = !DILocation(line: 42, column: 23, scope: !11)
!30 = !DILocation(line: 43, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 8)
!32 = !DILocation(line: 43, column: 8, scope: !11)
!33 = !DILocation(line: 46, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 44, column: 5)
!35 = !DILocation(line: 46, column: 27, scope: !34)
!36 = !DILocation(line: 46, column: 14, scope: !34)
!37 = !DILocation(line: 47, column: 5, scope: !34)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 49, type: !22)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!40 = !DILocation(line: 49, column: 17, scope: !39)
!41 = !DILocation(line: 50, column: 17, scope: !39)
!42 = !DILocation(line: 50, column: 9, scope: !39)
!43 = !DILocation(line: 51, column: 9, scope: !39)
!44 = !DILocation(line: 51, column: 23, scope: !39)
!45 = !DILocation(line: 53, column: 17, scope: !39)
!46 = !DILocation(line: 53, column: 9, scope: !39)
!47 = !DILocation(line: 55, column: 9, scope: !39)
!48 = !DILocation(line: 55, column: 21, scope: !39)
!49 = !DILocation(line: 56, column: 20, scope: !39)
!50 = !DILocation(line: 56, column: 9, scope: !39)
!51 = !DILocation(line: 58, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memmove_08_good", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 119, column: 5, scope: !52)
!54 = !DILocation(line: 120, column: 5, scope: !52)
!55 = !DILocation(line: 121, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !57, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!19, !19, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 133, type: !19)
!63 = !DILocation(line: 133, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 133, type: !59)
!65 = !DILocation(line: 133, column: 27, scope: !56)
!66 = !DILocation(line: 136, column: 22, scope: !56)
!67 = !DILocation(line: 136, column: 12, scope: !56)
!68 = !DILocation(line: 136, column: 5, scope: !56)
!69 = !DILocation(line: 138, column: 5, scope: !56)
!70 = !DILocation(line: 139, column: 5, scope: !56)
!71 = !DILocation(line: 140, column: 5, scope: !56)
!72 = !DILocation(line: 143, column: 5, scope: !56)
!73 = !DILocation(line: 144, column: 5, scope: !56)
!74 = !DILocation(line: 145, column: 5, scope: !56)
!75 = !DILocation(line: 147, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !77, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!19}
!79 = !DILocation(line: 27, column: 5, scope: !76)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 67, type: !16)
!82 = !DILocation(line: 67, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !12, line: 68, type: !22)
!84 = !DILocation(line: 68, column: 13, scope: !80)
!85 = !DILocation(line: 69, column: 13, scope: !80)
!86 = !DILocation(line: 69, column: 5, scope: !80)
!87 = !DILocation(line: 70, column: 5, scope: !80)
!88 = !DILocation(line: 70, column: 23, scope: !80)
!89 = !DILocation(line: 71, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !12, line: 71, column: 8)
!91 = !DILocation(line: 71, column: 8, scope: !80)
!92 = !DILocation(line: 74, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 72, column: 5)
!94 = !DILocation(line: 75, column: 5, scope: !93)
!95 = !DILocation(line: 79, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !12, line: 77, column: 5)
!97 = !DILocation(line: 79, column: 14, scope: !96)
!98 = !DILocalVariable(name: "source", scope: !99, file: !12, line: 82, type: !22)
!99 = distinct !DILexicalBlock(scope: !80, file: !12, line: 81, column: 5)
!100 = !DILocation(line: 82, column: 17, scope: !99)
!101 = !DILocation(line: 83, column: 17, scope: !99)
!102 = !DILocation(line: 83, column: 9, scope: !99)
!103 = !DILocation(line: 84, column: 9, scope: !99)
!104 = !DILocation(line: 84, column: 23, scope: !99)
!105 = !DILocation(line: 86, column: 17, scope: !99)
!106 = !DILocation(line: 86, column: 9, scope: !99)
!107 = !DILocation(line: 88, column: 9, scope: !99)
!108 = !DILocation(line: 88, column: 21, scope: !99)
!109 = !DILocation(line: 89, column: 20, scope: !99)
!110 = !DILocation(line: 89, column: 9, scope: !99)
!111 = !DILocation(line: 91, column: 1, scope: !80)
!112 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !77, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocation(line: 32, column: 5, scope: !112)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 96, type: !16)
!116 = !DILocation(line: 96, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBuffer", scope: !114, file: !12, line: 97, type: !22)
!118 = !DILocation(line: 97, column: 13, scope: !114)
!119 = !DILocation(line: 98, column: 13, scope: !114)
!120 = !DILocation(line: 98, column: 5, scope: !114)
!121 = !DILocation(line: 99, column: 5, scope: !114)
!122 = !DILocation(line: 99, column: 23, scope: !114)
!123 = !DILocation(line: 100, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !12, line: 100, column: 8)
!125 = !DILocation(line: 100, column: 8, scope: !114)
!126 = !DILocation(line: 103, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 101, column: 5)
!128 = !DILocation(line: 103, column: 14, scope: !127)
!129 = !DILocation(line: 104, column: 5, scope: !127)
!130 = !DILocalVariable(name: "source", scope: !131, file: !12, line: 106, type: !22)
!131 = distinct !DILexicalBlock(scope: !114, file: !12, line: 105, column: 5)
!132 = !DILocation(line: 106, column: 17, scope: !131)
!133 = !DILocation(line: 107, column: 17, scope: !131)
!134 = !DILocation(line: 107, column: 9, scope: !131)
!135 = !DILocation(line: 108, column: 9, scope: !131)
!136 = !DILocation(line: 108, column: 23, scope: !131)
!137 = !DILocation(line: 110, column: 17, scope: !131)
!138 = !DILocation(line: 110, column: 9, scope: !131)
!139 = !DILocation(line: 112, column: 9, scope: !131)
!140 = !DILocation(line: 112, column: 21, scope: !131)
!141 = !DILocation(line: 113, column: 20, scope: !131)
!142 = !DILocation(line: 113, column: 9, scope: !131)
!143 = !DILocation(line: 115, column: 1, scope: !114)
