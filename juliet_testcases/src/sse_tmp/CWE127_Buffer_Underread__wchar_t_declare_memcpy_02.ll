; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memcpy_02.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memcpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_memcpy_02_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !33
  store i32* %add.ptr, i32** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !39
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx4, align 4, !dbg !41
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %0 = bitcast i32* %arraydecay5 to i8*, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %2 = bitcast i32* %1 to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 400, i1 false), !dbg !42
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx6, align 4, !dbg !45
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  call void @printWLine(i32* %arraydecay7), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_memcpy_02_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__wchar_t_declare_memcpy_02_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__wchar_t_declare_memcpy_02_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !78
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !79
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i32* %arraydecay1, i32** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !86, metadata !DIExpression()), !dbg !88
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !89
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !90
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !91
  store i32 0, i32* %arrayidx4, align 4, !dbg !92
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !93
  %0 = bitcast i32* %arraydecay5 to i8*, !dbg !93
  %1 = load i32*, i32** %data, align 8, !dbg !94
  %2 = bitcast i32* %1 to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 400, i1 false), !dbg !93
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx6, align 4, !dbg !96
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !97
  call void @printWLine(i32* %arraydecay7), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !105
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !106
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !109
  store i32* %arraydecay1, i32** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !117
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx4, align 4, !dbg !119
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %0 = bitcast i32* %arraydecay5 to i8*, !dbg !120
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %2 = bitcast i32* %1 to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 400, i1 false), !dbg !120
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx6, align 4, !dbg !123
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  call void @printWLine(i32* %arraydecay7), !dbg !125
  ret void, !dbg !126
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memcpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_memcpy_02_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memcpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 30, column: 5)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!33 = !DILocation(line: 32, column: 27, scope: !31)
!34 = !DILocation(line: 32, column: 14, scope: !31)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 35, type: !22)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DILocation(line: 35, column: 17, scope: !36)
!38 = !DILocation(line: 36, column: 17, scope: !36)
!39 = !DILocation(line: 36, column: 9, scope: !36)
!40 = !DILocation(line: 37, column: 9, scope: !36)
!41 = !DILocation(line: 37, column: 21, scope: !36)
!42 = !DILocation(line: 39, column: 9, scope: !36)
!43 = !DILocation(line: 39, column: 22, scope: !36)
!44 = !DILocation(line: 41, column: 9, scope: !36)
!45 = !DILocation(line: 41, column: 21, scope: !36)
!46 = !DILocation(line: 42, column: 20, scope: !36)
!47 = !DILocation(line: 42, column: 9, scope: !36)
!48 = !DILocation(line: 44, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_memcpy_02_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 105, column: 5, scope: !49)
!51 = !DILocation(line: 106, column: 5, scope: !49)
!52 = !DILocation(line: 107, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !54, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!19, !19, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 119, type: !19)
!60 = !DILocation(line: 119, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 119, type: !56)
!62 = !DILocation(line: 119, column: 27, scope: !53)
!63 = !DILocation(line: 122, column: 22, scope: !53)
!64 = !DILocation(line: 122, column: 12, scope: !53)
!65 = !DILocation(line: 122, column: 5, scope: !53)
!66 = !DILocation(line: 124, column: 5, scope: !53)
!67 = !DILocation(line: 125, column: 5, scope: !53)
!68 = !DILocation(line: 126, column: 5, scope: !53)
!69 = !DILocation(line: 129, column: 5, scope: !53)
!70 = !DILocation(line: 130, column: 5, scope: !53)
!71 = !DILocation(line: 131, column: 5, scope: !53)
!72 = !DILocation(line: 133, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 53, type: !16)
!75 = !DILocation(line: 53, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !12, line: 54, type: !22)
!77 = !DILocation(line: 54, column: 13, scope: !73)
!78 = !DILocation(line: 55, column: 13, scope: !73)
!79 = !DILocation(line: 55, column: 5, scope: !73)
!80 = !DILocation(line: 56, column: 5, scope: !73)
!81 = !DILocation(line: 56, column: 23, scope: !73)
!82 = !DILocation(line: 65, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !12, line: 63, column: 5)
!84 = distinct !DILexicalBlock(scope: !73, file: !12, line: 57, column: 8)
!85 = !DILocation(line: 65, column: 14, scope: !83)
!86 = !DILocalVariable(name: "dest", scope: !87, file: !12, line: 68, type: !22)
!87 = distinct !DILexicalBlock(scope: !73, file: !12, line: 67, column: 5)
!88 = !DILocation(line: 68, column: 17, scope: !87)
!89 = !DILocation(line: 69, column: 17, scope: !87)
!90 = !DILocation(line: 69, column: 9, scope: !87)
!91 = !DILocation(line: 70, column: 9, scope: !87)
!92 = !DILocation(line: 70, column: 21, scope: !87)
!93 = !DILocation(line: 72, column: 9, scope: !87)
!94 = !DILocation(line: 72, column: 22, scope: !87)
!95 = !DILocation(line: 74, column: 9, scope: !87)
!96 = !DILocation(line: 74, column: 21, scope: !87)
!97 = !DILocation(line: 75, column: 20, scope: !87)
!98 = !DILocation(line: 75, column: 9, scope: !87)
!99 = !DILocation(line: 77, column: 1, scope: !73)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 82, type: !16)
!102 = !DILocation(line: 82, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !12, line: 83, type: !22)
!104 = !DILocation(line: 83, column: 13, scope: !100)
!105 = !DILocation(line: 84, column: 13, scope: !100)
!106 = !DILocation(line: 84, column: 5, scope: !100)
!107 = !DILocation(line: 85, column: 5, scope: !100)
!108 = !DILocation(line: 85, column: 23, scope: !100)
!109 = !DILocation(line: 89, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !12, line: 87, column: 5)
!111 = distinct !DILexicalBlock(scope: !100, file: !12, line: 86, column: 8)
!112 = !DILocation(line: 89, column: 14, scope: !110)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !12, line: 92, type: !22)
!114 = distinct !DILexicalBlock(scope: !100, file: !12, line: 91, column: 5)
!115 = !DILocation(line: 92, column: 17, scope: !114)
!116 = !DILocation(line: 93, column: 17, scope: !114)
!117 = !DILocation(line: 93, column: 9, scope: !114)
!118 = !DILocation(line: 94, column: 9, scope: !114)
!119 = !DILocation(line: 94, column: 21, scope: !114)
!120 = !DILocation(line: 96, column: 9, scope: !114)
!121 = !DILocation(line: 96, column: 22, scope: !114)
!122 = !DILocation(line: 98, column: 9, scope: !114)
!123 = !DILocation(line: 98, column: 21, scope: !114)
!124 = !DILocation(line: 99, column: 20, scope: !114)
!125 = !DILocation(line: 99, column: 9, scope: !114)
!126 = !DILocation(line: 101, column: 1, scope: !100)
