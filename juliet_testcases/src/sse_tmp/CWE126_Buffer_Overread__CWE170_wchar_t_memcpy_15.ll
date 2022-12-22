; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_15_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !15, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !30
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !33
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !33
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !33
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !33
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !34
  call void @printWLine(i32* %arraydecay3), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_15_good() #0 !dbg !37 {
entry:
  call void @good1(), !dbg !38
  call void @good2(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #5, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #5, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_15_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_15_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !61 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !62, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !65, metadata !DIExpression()), !dbg !66
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !67
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !68
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !69
  store i32 0, i32* %arrayidx, align 4, !dbg !70
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !71
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !71
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !71
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !71
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !71
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !72
  store i32 0, i32* %arrayidx3, align 4, !dbg !73
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !74
  call void @printWLine(i32* %arraydecay4), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !77 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !78, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !83
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !84
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !87
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !87
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !87
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx3, align 4, !dbg !89
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !90
  call void @printWLine(i32* %arraydecay4), !dbg !91
  ret void, !dbg !92
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_15_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_15.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !16, file: !12, line: 28, type: !17)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 4800, elements: !21)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{!22}
!22 = !DISubrange(count: 150)
!23 = !DILocation(line: 28, column: 17, scope: !16)
!24 = !DILocalVariable(name: "dest", scope: !16, file: !12, line: 28, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 28, column: 28, scope: !16)
!29 = !DILocation(line: 30, column: 17, scope: !16)
!30 = !DILocation(line: 30, column: 9, scope: !16)
!31 = !DILocation(line: 31, column: 9, scope: !16)
!32 = !DILocation(line: 31, column: 19, scope: !16)
!33 = !DILocation(line: 32, column: 9, scope: !16)
!34 = !DILocation(line: 34, column: 20, scope: !16)
!35 = !DILocation(line: 34, column: 9, scope: !16)
!36 = !DILocation(line: 42, column: 1, scope: !11)
!37 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_15_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 96, column: 5, scope: !37)
!39 = !DILocation(line: 97, column: 5, scope: !37)
!40 = !DILocation(line: 98, column: 1, scope: !37)
!41 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !42, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!20, !20, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !12, line: 109, type: !20)
!48 = !DILocation(line: 109, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !12, line: 109, type: !44)
!50 = !DILocation(line: 109, column: 27, scope: !41)
!51 = !DILocation(line: 112, column: 22, scope: !41)
!52 = !DILocation(line: 112, column: 12, scope: !41)
!53 = !DILocation(line: 112, column: 5, scope: !41)
!54 = !DILocation(line: 114, column: 5, scope: !41)
!55 = !DILocation(line: 115, column: 5, scope: !41)
!56 = !DILocation(line: 116, column: 5, scope: !41)
!57 = !DILocation(line: 119, column: 5, scope: !41)
!58 = !DILocation(line: 120, column: 5, scope: !41)
!59 = !DILocation(line: 121, column: 5, scope: !41)
!60 = !DILocation(line: 123, column: 5, scope: !41)
!61 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "data", scope: !63, file: !12, line: 59, type: !17)
!63 = distinct !DILexicalBlock(scope: !61, file: !12, line: 58, column: 5)
!64 = !DILocation(line: 59, column: 17, scope: !63)
!65 = !DILocalVariable(name: "dest", scope: !63, file: !12, line: 59, type: !25)
!66 = !DILocation(line: 59, column: 28, scope: !63)
!67 = !DILocation(line: 61, column: 17, scope: !63)
!68 = !DILocation(line: 61, column: 9, scope: !63)
!69 = !DILocation(line: 62, column: 9, scope: !63)
!70 = !DILocation(line: 62, column: 19, scope: !63)
!71 = !DILocation(line: 63, column: 9, scope: !63)
!72 = !DILocation(line: 64, column: 9, scope: !63)
!73 = !DILocation(line: 64, column: 18, scope: !63)
!74 = !DILocation(line: 65, column: 20, scope: !63)
!75 = !DILocation(line: 65, column: 9, scope: !63)
!76 = !DILocation(line: 69, column: 1, scope: !61)
!77 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 78, type: !17)
!79 = distinct !DILexicalBlock(scope: !77, file: !12, line: 77, column: 5)
!80 = !DILocation(line: 78, column: 17, scope: !79)
!81 = !DILocalVariable(name: "dest", scope: !79, file: !12, line: 78, type: !25)
!82 = !DILocation(line: 78, column: 28, scope: !79)
!83 = !DILocation(line: 80, column: 17, scope: !79)
!84 = !DILocation(line: 80, column: 9, scope: !79)
!85 = !DILocation(line: 81, column: 9, scope: !79)
!86 = !DILocation(line: 81, column: 19, scope: !79)
!87 = !DILocation(line: 82, column: 9, scope: !79)
!88 = !DILocation(line: 83, column: 9, scope: !79)
!89 = !DILocation(line: 83, column: 18, scope: !79)
!90 = !DILocation(line: 84, column: 20, scope: !79)
!91 = !DILocation(line: 84, column: 9, scope: !79)
!92 = !DILocation(line: 92, column: 1, scope: !77)
