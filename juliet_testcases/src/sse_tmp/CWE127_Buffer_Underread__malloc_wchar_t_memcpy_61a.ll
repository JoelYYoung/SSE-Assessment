; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %0 = load i32*, i32** %data, align 8, !dbg !22
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61b_badSource(i32* %0), !dbg !23
  store i32* %call, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !25, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !31
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !35
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %3 = bitcast i32* %2 to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !35
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !39
  call void @printWLine(i32* %arraydecay4), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61b_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i32* null, i32** %data, align 8, !dbg !68
  %0 = load i32*, i32** %data, align 8, !dbg !69
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61b_goodG2BSource(i32* %0), !dbg !70
  store i32* %call, i32** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !72, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !76
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !79
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !79
  %2 = load i32*, i32** %data, align 8, !dbg !80
  %3 = bitcast i32* %2 to i8*, !dbg !79
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !79
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !81
  store i32 0, i32* %arrayidx3, align 4, !dbg !82
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !83
  call void @printWLine(i32* %arraydecay4), !dbg !84
  ret void, !dbg !85
}

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !11)
!21 = !DILocation(line: 29, column: 10, scope: !11)
!22 = !DILocation(line: 30, column: 73, scope: !11)
!23 = !DILocation(line: 30, column: 12, scope: !11)
!24 = !DILocation(line: 30, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dest", scope: !26, file: !12, line: 32, type: !27)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 32, column: 17, scope: !26)
!31 = !DILocation(line: 33, column: 17, scope: !26)
!32 = !DILocation(line: 33, column: 9, scope: !26)
!33 = !DILocation(line: 34, column: 9, scope: !26)
!34 = !DILocation(line: 34, column: 21, scope: !26)
!35 = !DILocation(line: 36, column: 9, scope: !26)
!36 = !DILocation(line: 36, column: 22, scope: !26)
!37 = !DILocation(line: 38, column: 9, scope: !26)
!38 = !DILocation(line: 38, column: 21, scope: !26)
!39 = !DILocation(line: 39, column: 20, scope: !26)
!40 = !DILocation(line: 39, column: 9, scope: !26)
!41 = !DILocation(line: 43, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memcpy_61_good", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 73, column: 5, scope: !42)
!44 = !DILocation(line: 74, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 86, type: !46, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!19, !19, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 86, type: !19)
!52 = !DILocation(line: 86, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 86, type: !48)
!54 = !DILocation(line: 86, column: 27, scope: !45)
!55 = !DILocation(line: 89, column: 22, scope: !45)
!56 = !DILocation(line: 89, column: 12, scope: !45)
!57 = !DILocation(line: 89, column: 5, scope: !45)
!58 = !DILocation(line: 91, column: 5, scope: !45)
!59 = !DILocation(line: 92, column: 5, scope: !45)
!60 = !DILocation(line: 93, column: 5, scope: !45)
!61 = !DILocation(line: 96, column: 5, scope: !45)
!62 = !DILocation(line: 97, column: 5, scope: !45)
!63 = !DILocation(line: 98, column: 5, scope: !45)
!64 = !DILocation(line: 100, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 54, type: !16)
!67 = !DILocation(line: 54, column: 15, scope: !65)
!68 = !DILocation(line: 55, column: 10, scope: !65)
!69 = !DILocation(line: 56, column: 77, scope: !65)
!70 = !DILocation(line: 56, column: 12, scope: !65)
!71 = !DILocation(line: 56, column: 10, scope: !65)
!72 = !DILocalVariable(name: "dest", scope: !73, file: !12, line: 58, type: !27)
!73 = distinct !DILexicalBlock(scope: !65, file: !12, line: 57, column: 5)
!74 = !DILocation(line: 58, column: 17, scope: !73)
!75 = !DILocation(line: 59, column: 17, scope: !73)
!76 = !DILocation(line: 59, column: 9, scope: !73)
!77 = !DILocation(line: 60, column: 9, scope: !73)
!78 = !DILocation(line: 60, column: 21, scope: !73)
!79 = !DILocation(line: 62, column: 9, scope: !73)
!80 = !DILocation(line: 62, column: 22, scope: !73)
!81 = !DILocation(line: 64, column: 9, scope: !73)
!82 = !DILocation(line: 64, column: 21, scope: !73)
!83 = !DILocation(line: 65, column: 20, scope: !73)
!84 = !DILocation(line: 65, column: 9, scope: !73)
!85 = !DILocation(line: 69, column: 1, scope: !65)
