; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %call = call i32 @staticReturnsTrue(), !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !33
  %1 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %3 = load i32*, i32** %data, align 8, !dbg !44
  %call3 = call i64 @wcslen(i32* %3) #7, !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay2, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %4) #6, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %5), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_08_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_08_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_08_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !75 {
entry:
  ret i32 1, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !84
  store i32* %arraydecay, i32** %data, align 8, !dbg !85
  %call = call i32 @staticReturnsFalse(), !dbg !86
  %tobool = icmp ne i32 %call, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !92
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !99
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !100
  %3 = load i32*, i32** %data, align 8, !dbg !101
  %call3 = call i64 @wcslen(i32* %3) #7, !dbg !102
  %4 = load i32*, i32** %data, align 8, !dbg !103
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay2, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %4) #6, !dbg !104
  %5 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %5), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !108 {
entry:
  ret i32 0, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !115
  store i32* %arraydecay, i32** %data, align 8, !dbg !116
  %call = call i32 @staticReturnsTrue(), !dbg !117
  %tobool = icmp ne i32 %call, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !120
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !128
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !129
  %3 = load i32*, i32** %data, align 8, !dbg !130
  %call3 = call i64 @wcslen(i32* %3) #7, !dbg !131
  %4 = load i32*, i32** %data, align 8, !dbg !132
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay2, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %4) #6, !dbg !133
  %5 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %5), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_08_bad", scope: !12, file: !12, line: 43, type: !13, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 45, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 45, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 46, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 46, column: 13, scope: !11)
!26 = !DILocation(line: 47, column: 12, scope: !11)
!27 = !DILocation(line: 47, column: 10, scope: !11)
!28 = !DILocation(line: 48, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 8)
!30 = !DILocation(line: 48, column: 8, scope: !11)
!31 = !DILocation(line: 51, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !12, line: 49, column: 5)
!33 = !DILocation(line: 51, column: 9, scope: !32)
!34 = !DILocation(line: 52, column: 9, scope: !32)
!35 = !DILocation(line: 52, column: 21, scope: !32)
!36 = !DILocation(line: 53, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 55, type: !39)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 54, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 55, column: 17, scope: !38)
!43 = !DILocation(line: 57, column: 18, scope: !38)
!44 = !DILocation(line: 57, column: 31, scope: !38)
!45 = !DILocation(line: 57, column: 24, scope: !38)
!46 = !DILocation(line: 57, column: 45, scope: !38)
!47 = !DILocation(line: 57, column: 9, scope: !38)
!48 = !DILocation(line: 58, column: 20, scope: !38)
!49 = !DILocation(line: 58, column: 9, scope: !38)
!50 = !DILocation(line: 60, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_08_good", scope: !12, file: !12, line: 111, type: !13, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 113, column: 5, scope: !51)
!53 = !DILocation(line: 114, column: 5, scope: !51)
!54 = !DILocation(line: 115, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !56, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!19, !19, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 127, type: !19)
!62 = !DILocation(line: 127, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 127, type: !58)
!64 = !DILocation(line: 127, column: 27, scope: !55)
!65 = !DILocation(line: 130, column: 22, scope: !55)
!66 = !DILocation(line: 130, column: 12, scope: !55)
!67 = !DILocation(line: 130, column: 5, scope: !55)
!68 = !DILocation(line: 132, column: 5, scope: !55)
!69 = !DILocation(line: 133, column: 5, scope: !55)
!70 = !DILocation(line: 134, column: 5, scope: !55)
!71 = !DILocation(line: 137, column: 5, scope: !55)
!72 = !DILocation(line: 138, column: 5, scope: !55)
!73 = !DILocation(line: 139, column: 5, scope: !55)
!74 = !DILocation(line: 141, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 31, type: !76, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!19}
!78 = !DILocation(line: 33, column: 5, scope: !75)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 69, type: !16)
!81 = !DILocation(line: 69, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !12, line: 70, type: !22)
!83 = !DILocation(line: 70, column: 13, scope: !79)
!84 = !DILocation(line: 71, column: 12, scope: !79)
!85 = !DILocation(line: 71, column: 10, scope: !79)
!86 = !DILocation(line: 72, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !12, line: 72, column: 8)
!88 = !DILocation(line: 72, column: 8, scope: !79)
!89 = !DILocation(line: 75, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !12, line: 73, column: 5)
!91 = !DILocation(line: 76, column: 5, scope: !90)
!92 = !DILocation(line: 80, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !12, line: 78, column: 5)
!94 = !DILocation(line: 80, column: 9, scope: !93)
!95 = !DILocation(line: 81, column: 9, scope: !93)
!96 = !DILocation(line: 81, column: 20, scope: !93)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !12, line: 84, type: !39)
!98 = distinct !DILexicalBlock(scope: !79, file: !12, line: 83, column: 5)
!99 = !DILocation(line: 84, column: 17, scope: !98)
!100 = !DILocation(line: 86, column: 18, scope: !98)
!101 = !DILocation(line: 86, column: 31, scope: !98)
!102 = !DILocation(line: 86, column: 24, scope: !98)
!103 = !DILocation(line: 86, column: 45, scope: !98)
!104 = !DILocation(line: 86, column: 9, scope: !98)
!105 = !DILocation(line: 87, column: 20, scope: !98)
!106 = !DILocation(line: 87, column: 9, scope: !98)
!107 = !DILocation(line: 89, column: 1, scope: !79)
!108 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 36, type: !76, scopeLine: 37, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocation(line: 38, column: 5, scope: !108)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 94, type: !16)
!112 = !DILocation(line: 94, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !12, line: 95, type: !22)
!114 = !DILocation(line: 95, column: 13, scope: !110)
!115 = !DILocation(line: 96, column: 12, scope: !110)
!116 = !DILocation(line: 96, column: 10, scope: !110)
!117 = !DILocation(line: 97, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !110, file: !12, line: 97, column: 8)
!119 = !DILocation(line: 97, column: 8, scope: !110)
!120 = !DILocation(line: 100, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 98, column: 5)
!122 = !DILocation(line: 100, column: 9, scope: !121)
!123 = !DILocation(line: 101, column: 9, scope: !121)
!124 = !DILocation(line: 101, column: 20, scope: !121)
!125 = !DILocation(line: 102, column: 5, scope: !121)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !12, line: 104, type: !39)
!127 = distinct !DILexicalBlock(scope: !110, file: !12, line: 103, column: 5)
!128 = !DILocation(line: 104, column: 17, scope: !127)
!129 = !DILocation(line: 106, column: 18, scope: !127)
!130 = !DILocation(line: 106, column: 31, scope: !127)
!131 = !DILocation(line: 106, column: 24, scope: !127)
!132 = !DILocation(line: 106, column: 45, scope: !127)
!133 = !DILocation(line: 106, column: 9, scope: !127)
!134 = !DILocation(line: 107, column: 20, scope: !127)
!135 = !DILocation(line: 107, column: 9, scope: !127)
!136 = !DILocation(line: 109, column: 1, scope: !110)
