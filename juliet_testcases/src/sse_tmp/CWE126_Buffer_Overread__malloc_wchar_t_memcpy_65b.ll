; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_65b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_65b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !25
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !26
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !29
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !29
  %1 = load i32*, i32** %data.addr, align 8, !dbg !30
  %2 = bitcast i32* %1 to i8*, !dbg !29
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !31
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !32
  %mul = mul i64 %call3, 4, !dbg !33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !29
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx4, align 4, !dbg !35
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  call void @printWLine(i32* %arraydecay5), !dbg !37
  %3 = load i32*, i32** %data.addr, align 8, !dbg !38
  %4 = bitcast i32* %3 to i8*, !dbg !38
  call void @free(i8* %4) #6, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_65b_goodG2BSink(i32* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !48
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !51
  %1 = load i32*, i32** %data.addr, align 8, !dbg !52
  %2 = bitcast i32* %1 to i8*, !dbg !51
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !54
  %mul = mul i64 %call3, 4, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay5), !dbg !59
  %3 = load i32*, i32** %data.addr, align 8, !dbg !60
  %4 = bitcast i32* %3 to i8*, !dbg !60
  call void @free(i8* %4) #6, !dbg !61
  ret void, !dbg !62
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_65b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!18 = !DILocation(line: 23, column: 74, scope: !9)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !10, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 3200, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 17, scope: !20)
!25 = !DILocation(line: 27, column: 17, scope: !20)
!26 = !DILocation(line: 27, column: 9, scope: !20)
!27 = !DILocation(line: 28, column: 9, scope: !20)
!28 = !DILocation(line: 28, column: 21, scope: !20)
!29 = !DILocation(line: 31, column: 9, scope: !20)
!30 = !DILocation(line: 31, column: 22, scope: !20)
!31 = !DILocation(line: 31, column: 35, scope: !20)
!32 = !DILocation(line: 31, column: 28, scope: !20)
!33 = !DILocation(line: 31, column: 40, scope: !20)
!34 = !DILocation(line: 32, column: 9, scope: !20)
!35 = !DILocation(line: 32, column: 21, scope: !20)
!36 = !DILocation(line: 33, column: 20, scope: !20)
!37 = !DILocation(line: 33, column: 9, scope: !20)
!38 = !DILocation(line: 34, column: 14, scope: !20)
!39 = !DILocation(line: 34, column: 9, scope: !20)
!40 = !DILocation(line: 36, column: 1, scope: !9)
!41 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_65b_goodG2BSink", scope: !10, file: !10, line: 43, type: !11, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !10, line: 43, type: !13)
!43 = !DILocation(line: 43, column: 78, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !10, line: 46, type: !21)
!45 = distinct !DILexicalBlock(scope: !41, file: !10, line: 45, column: 5)
!46 = !DILocation(line: 46, column: 17, scope: !45)
!47 = !DILocation(line: 47, column: 17, scope: !45)
!48 = !DILocation(line: 47, column: 9, scope: !45)
!49 = !DILocation(line: 48, column: 9, scope: !45)
!50 = !DILocation(line: 48, column: 21, scope: !45)
!51 = !DILocation(line: 51, column: 9, scope: !45)
!52 = !DILocation(line: 51, column: 22, scope: !45)
!53 = !DILocation(line: 51, column: 35, scope: !45)
!54 = !DILocation(line: 51, column: 28, scope: !45)
!55 = !DILocation(line: 51, column: 40, scope: !45)
!56 = !DILocation(line: 52, column: 9, scope: !45)
!57 = !DILocation(line: 52, column: 21, scope: !45)
!58 = !DILocation(line: 53, column: 20, scope: !45)
!59 = !DILocation(line: 53, column: 9, scope: !45)
!60 = !DILocation(line: 54, column: 14, scope: !45)
!61 = !DILocation(line: 54, column: 9, scope: !45)
!62 = !DILocation(line: 56, column: 1, scope: !41)
