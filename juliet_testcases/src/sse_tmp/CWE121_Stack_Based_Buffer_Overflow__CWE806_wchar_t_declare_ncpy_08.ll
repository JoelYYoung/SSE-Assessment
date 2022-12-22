; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_08_bad() #0 !dbg !11 {
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
  %4 = load i32*, i32** %data, align 8, !dbg !45
  %call3 = call i64 @wcslen(i32* %4) #7, !dbg !46
  %call4 = call i32* @wcsncpy(i32* %arraydecay2, i32* %3, i64 %call3) #6, !dbg !47
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !48
  store i32 0, i32* %arrayidx5, align 4, !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %5), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_08_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #6, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #6, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_08_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_08_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !77 {
entry:
  ret i32 1, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !86
  store i32* %arraydecay, i32** %data, align 8, !dbg !87
  %call = call i32 @staticReturnsFalse(), !dbg !88
  %tobool = icmp ne i32 %call, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !94
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !101
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %4 = load i32*, i32** %data, align 8, !dbg !104
  %call3 = call i64 @wcslen(i32* %4) #7, !dbg !105
  %call4 = call i32* @wcsncpy(i32* %arraydecay2, i32* %3, i64 %call3) #6, !dbg !106
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !107
  store i32 0, i32* %arrayidx5, align 4, !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* %5), !dbg !110
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
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !119
  store i32* %arraydecay, i32** %data, align 8, !dbg !120
  %call = call i32 @staticReturnsTrue(), !dbg !121
  %tobool = icmp ne i32 %call, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !124
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !126
  %1 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !132
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !133
  %3 = load i32*, i32** %data, align 8, !dbg !134
  %4 = load i32*, i32** %data, align 8, !dbg !135
  %call3 = call i64 @wcslen(i32* %4) #7, !dbg !136
  %call4 = call i32* @wcsncpy(i32* %arraydecay2, i32* %3, i64 %call3) #6, !dbg !137
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !138
  store i32 0, i32* %arrayidx5, align 4, !dbg !139
  %5 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* %5), !dbg !141
  ret void, !dbg !142
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocation(line: 41, column: 12, scope: !11)
!27 = !DILocation(line: 41, column: 10, scope: !11)
!28 = !DILocation(line: 42, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!30 = !DILocation(line: 42, column: 8, scope: !11)
!31 = !DILocation(line: 45, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !12, line: 43, column: 5)
!33 = !DILocation(line: 45, column: 9, scope: !32)
!34 = !DILocation(line: 46, column: 9, scope: !32)
!35 = !DILocation(line: 46, column: 21, scope: !32)
!36 = !DILocation(line: 47, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 49, type: !39)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 49, column: 17, scope: !38)
!43 = !DILocation(line: 51, column: 17, scope: !38)
!44 = !DILocation(line: 51, column: 23, scope: !38)
!45 = !DILocation(line: 51, column: 36, scope: !38)
!46 = !DILocation(line: 51, column: 29, scope: !38)
!47 = !DILocation(line: 51, column: 9, scope: !38)
!48 = !DILocation(line: 52, column: 9, scope: !38)
!49 = !DILocation(line: 52, column: 20, scope: !38)
!50 = !DILocation(line: 53, column: 20, scope: !38)
!51 = !DILocation(line: 53, column: 9, scope: !38)
!52 = !DILocation(line: 55, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_08_good", scope: !12, file: !12, line: 108, type: !13, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 110, column: 5, scope: !53)
!55 = !DILocation(line: 111, column: 5, scope: !53)
!56 = !DILocation(line: 112, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 124, type: !58, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!19, !19, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 124, type: !19)
!64 = !DILocation(line: 124, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 124, type: !60)
!66 = !DILocation(line: 124, column: 27, scope: !57)
!67 = !DILocation(line: 127, column: 22, scope: !57)
!68 = !DILocation(line: 127, column: 12, scope: !57)
!69 = !DILocation(line: 127, column: 5, scope: !57)
!70 = !DILocation(line: 129, column: 5, scope: !57)
!71 = !DILocation(line: 130, column: 5, scope: !57)
!72 = !DILocation(line: 131, column: 5, scope: !57)
!73 = !DILocation(line: 134, column: 5, scope: !57)
!74 = !DILocation(line: 135, column: 5, scope: !57)
!75 = !DILocation(line: 136, column: 5, scope: !57)
!76 = !DILocation(line: 138, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !78, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!19}
!80 = !DILocation(line: 27, column: 5, scope: !77)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 64, type: !16)
!83 = !DILocation(line: 64, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !12, line: 65, type: !22)
!85 = !DILocation(line: 65, column: 13, scope: !81)
!86 = !DILocation(line: 66, column: 12, scope: !81)
!87 = !DILocation(line: 66, column: 10, scope: !81)
!88 = !DILocation(line: 67, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !12, line: 67, column: 8)
!90 = !DILocation(line: 67, column: 8, scope: !81)
!91 = !DILocation(line: 70, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 68, column: 5)
!93 = !DILocation(line: 71, column: 5, scope: !92)
!94 = !DILocation(line: 75, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !12, line: 73, column: 5)
!96 = !DILocation(line: 75, column: 9, scope: !95)
!97 = !DILocation(line: 76, column: 9, scope: !95)
!98 = !DILocation(line: 76, column: 20, scope: !95)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !12, line: 79, type: !39)
!100 = distinct !DILexicalBlock(scope: !81, file: !12, line: 78, column: 5)
!101 = !DILocation(line: 79, column: 17, scope: !100)
!102 = !DILocation(line: 81, column: 17, scope: !100)
!103 = !DILocation(line: 81, column: 23, scope: !100)
!104 = !DILocation(line: 81, column: 36, scope: !100)
!105 = !DILocation(line: 81, column: 29, scope: !100)
!106 = !DILocation(line: 81, column: 9, scope: !100)
!107 = !DILocation(line: 82, column: 9, scope: !100)
!108 = !DILocation(line: 82, column: 20, scope: !100)
!109 = !DILocation(line: 83, column: 20, scope: !100)
!110 = !DILocation(line: 83, column: 9, scope: !100)
!111 = !DILocation(line: 85, column: 1, scope: !81)
!112 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !78, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocation(line: 32, column: 5, scope: !112)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 90, type: !16)
!116 = !DILocation(line: 90, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBuffer", scope: !114, file: !12, line: 91, type: !22)
!118 = !DILocation(line: 91, column: 13, scope: !114)
!119 = !DILocation(line: 92, column: 12, scope: !114)
!120 = !DILocation(line: 92, column: 10, scope: !114)
!121 = !DILocation(line: 93, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !114, file: !12, line: 93, column: 8)
!123 = !DILocation(line: 93, column: 8, scope: !114)
!124 = !DILocation(line: 96, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 94, column: 5)
!126 = !DILocation(line: 96, column: 9, scope: !125)
!127 = !DILocation(line: 97, column: 9, scope: !125)
!128 = !DILocation(line: 97, column: 20, scope: !125)
!129 = !DILocation(line: 98, column: 5, scope: !125)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !12, line: 100, type: !39)
!131 = distinct !DILexicalBlock(scope: !114, file: !12, line: 99, column: 5)
!132 = !DILocation(line: 100, column: 17, scope: !131)
!133 = !DILocation(line: 102, column: 17, scope: !131)
!134 = !DILocation(line: 102, column: 23, scope: !131)
!135 = !DILocation(line: 102, column: 36, scope: !131)
!136 = !DILocation(line: 102, column: 29, scope: !131)
!137 = !DILocation(line: 102, column: 9, scope: !131)
!138 = !DILocation(line: 103, column: 9, scope: !131)
!139 = !DILocation(line: 103, column: 20, scope: !131)
!140 = !DILocation(line: 104, column: 20, scope: !131)
!141 = !DILocation(line: 104, column: 9, scope: !131)
!142 = !DILocation(line: 106, column: 1, scope: !114)
